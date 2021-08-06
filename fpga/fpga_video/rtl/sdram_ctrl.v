module sdram_ctrl
#(
	parameter	SDRAM_MHZ   			= 133,
	parameter	SDRAM_DATA_W 			= 16,
	parameter	SDRAM_ADDR_W 			= 22,
	parameter	SDRAM_COL_W 			= 8,
	parameter	SDRAM_BANK_W 			= 2,
	parameter  	SDRAM_BANKS          = 2 ** SDRAM_BANK_W,
	parameter   SDRAM_ROW_W          = SDRAM_ADDR_W - SDRAM_COL_W - SDRAM_BANK_W,
	parameter   SDRAM_REFRESH_CNT    = 2 ** SDRAM_ROW_W,
	parameter   SDRAM_START_DELAY    = (100 * SDRAM_MHZ), // 100uS
	parameter   SDRAM_REFRESH_CYCLES = (64000*SDRAM_MHZ) / SDRAM_REFRESH_CNT-1,
	parameter   SDRAM_READ_LATENCY   = 2,
	parameter	SDRAM_T_RP				= 3,
	parameter	SDRAM_T_RFC				= 9,
	parameter	SDRAM_T_MRD				= 2,
	parameter	SDRAM_T_RCD				= 3
)
(
	input		wire			i_clk,
	input		wire			i_reset_n,
	inout		wire[(SDRAM_DATA_W-1):0]	io_dq,
	output	wire[(SDRAM_ROW_W-1):0]		o_A,
	output	wire[(SDRAM_BANK_W-1):0]	o_BS,
	output	wire			o_CSn,
	output	wire			o_CKE,
	output	wire			o_LDQM,
	output	wire			o_UDQM,
	output	wire			o_WEn,
	output	wire			o_CASn,
	output	wire			o_RASn,
	input		wire			i_fifo_empty,
	input		wire[24:0]	i_fifo_data,
	output	wire			o_fifo_read,
	input		wire[7:0]	i_line_idx,
	input		wire			i_line_end,
	output	wire			o_vdata_valid,
	output	wire			o_vdata_reset,
	output	wire[15:0]	o_vdata
);

	localparam CMD_W             = 4;
	localparam CMD_NOP           = 4'b0111;
	localparam CMD_ACTIVE        = 4'b0011;
	localparam CMD_READ          = 4'b0101;
	localparam CMD_WRITE         = 4'b0100;
	localparam CMD_TERMINATE     = 4'b0110;
	localparam CMD_PRECHARGE     = 4'b0010;
	localparam CMD_REFRESH       = 4'b0001;
	localparam CMD_LOAD_MODE     = 4'b0000;

	localparam MODE_REG          =
	{
		3'b000,
		1'b1,			// write burst mode (SLA)
		2'b00,		// Operation mode (std)
		3'b011,		// CAS lat (3)
		1'b0,			// burst type (seq)
		3'b011		// burst length (8)
	};

	localparam STATE_W           = 5;
	localparam STATE_INIT_PRECH  = 0;
	localparam STATE_INIT_NOP1   = STATE_INIT_PRECH + 1;
	localparam STATE_INIT_REFR1  = STATE_INIT_NOP1 + 1;
	localparam STATE_INIT_NOP2   = STATE_INIT_REFR1 + 1;
	localparam STATE_INIT_REFR2  = STATE_INIT_NOP2 + 1;
	localparam STATE_INIT_NOP3   = STATE_INIT_REFR2 + 1;
	localparam STATE_INIT_LMDR   = STATE_INIT_NOP3 + 1;
	localparam STATE_INIT_NOP4   = STATE_INIT_LMDR + 1;
	localparam STATE_IDLE        = STATE_INIT_NOP4 + 1;
	localparam STATE_ACTIVATE    = STATE_IDLE + 1;
	localparam STATE_ACTIVATE_NOP= STATE_ACTIVATE + 1;
	localparam STATE_PRECH  	  = STATE_ACTIVATE_NOP + 1;
	localparam STATE_PRECH_NOP   = STATE_PRECH + 1;
	localparam STATE_REFRESH     = STATE_PRECH_NOP + 1;
	localparam STATE_REFRESH_NOP = STATE_REFRESH + 1;
	localparam STATE_READ        = STATE_REFRESH_NOP + 1;
	localparam STATE_READ_NOP    = STATE_READ + 1;
	localparam STATE_READ_DATA   = STATE_READ_NOP + 1;
	localparam STATE_WRITE       = STATE_READ_DATA + 1;
	localparam STATE_WRITE_NOP   = STATE_WRITE + 1;
	localparam STATE_PRECHARGE   = STATE_WRITE_NOP + 1;

	localparam AUTO_PRECHARGE    = 10;
	localparam ALL_BANKS         = 10;
	
	localparam WAIT_WIDTH		  = 14;
	localparam REFR_WIDTH		  = 12;

	reg[(CMD_W-1):0]			r_cmd;
	reg[(STATE_W-1):0]		r_state;
	reg							r_cke;
	reg[1:0]						r_dqm;
	reg[(SDRAM_BANK_W-1):0]	r_ba;
	reg[(SDRAM_ADDR_W-1):0]	r_addr_tmp;
	reg[(SDRAM_ROW_W-1):0]	r_addr;
	reg[(WAIT_WIDTH-1):0]	r_wait;

	reg[(REFR_WIDTH-1):0]	r_refr_cnt;
	reg							r_refr_reset;
	wire							w_refr_req = ~(|r_refr_cnt);

	always @(posedge i_clk)
	begin
		if ((i_reset_n == 1'b0) || (r_refr_reset == 1'b1))
		begin
			r_refr_cnt <= (SDRAM_REFRESH_CYCLES - 18*6);
		end
			else if (w_refr_req == 1'b0)
		begin
			r_refr_cnt <= r_refr_cnt - 1'b1;
		end
	end

	reg							r_line_end;
	reg							r_line_end_prev;
	reg							r_vdata_req;
	wire							w_line_ended = r_line_end & (!r_line_end_prev);
	reg[15:0]					r_video_addr;
	reg[4:0]						r_col_cnt;
	reg							r_write_low;
	reg[7:0]						r_wr_data;
	reg							r_fifo_next;

	always @(posedge i_clk)
	begin
		r_line_end <= i_line_end;
		r_line_end_prev <= r_line_end;
	end

	always @(posedge i_clk)
	begin
		if (w_line_ended == 1'b1)
		begin
			r_vdata_req <= 1'b1;
			r_video_addr <= { 1'b1, 1'b0, 6'b0, i_line_idx };
		end
		else if (r_state == STATE_READ)
			r_vdata_req <= 1'b0;
	end

	always @(posedge i_clk)
	begin
		if (i_reset_n == 1'b0)
		begin
			r_state <= STATE_INIT_PRECH;
			r_cmd <= CMD_NOP;
			r_wait <= SDRAM_START_DELAY;
			r_dqm <= 2'b11;
			r_refr_reset <= 1'b0;
			r_fifo_next <= 1'b0;
		end
			else if (r_wait != { WAIT_WIDTH{1'b0} })
		begin
			r_wait <= r_wait - 1'b1;
		end
			else
		case (r_state)
		STATE_INIT_PRECH:
			begin
				r_state <= STATE_INIT_NOP1;
				r_cmd <= CMD_PRECHARGE;
				r_addr[AUTO_PRECHARGE] <= 1'b1;
				r_ba <= 2'b00;
			end
		STATE_INIT_NOP1:
			begin
				r_state <= STATE_INIT_REFR1;
				r_cmd <= CMD_NOP;
				r_wait <= (SDRAM_T_RP - 1);
				r_addr <= { 12{1'b0} };
			end
		STATE_INIT_REFR1:
			begin
				r_state <= STATE_INIT_NOP2;
				r_cmd <= CMD_REFRESH;
			end
		STATE_INIT_NOP2:
			begin
				r_state <= STATE_INIT_REFR2;
				r_cmd <= CMD_NOP;
				r_wait <= (SDRAM_T_RFC - 1);
			end
		STATE_INIT_REFR2:
			begin
				r_state <= STATE_INIT_NOP3;
				r_cmd <= CMD_REFRESH;
			end
		STATE_INIT_NOP3:
			begin
				r_state <= STATE_INIT_LMDR;
				r_cmd <= CMD_NOP;
				r_wait <= (SDRAM_T_RFC - 1);
			end
		STATE_INIT_LMDR:
			begin
				r_state <= STATE_INIT_NOP4;
				r_cmd <= CMD_LOAD_MODE;
				r_addr <= MODE_REG;
			end
		STATE_INIT_NOP4:
			begin
				r_state <= STATE_IDLE;
				r_cmd <= CMD_NOP;
				r_wait <= (SDRAM_T_MRD - 1);
				r_addr <= { 12{1'b0} };
			end
		STATE_IDLE:
			begin
				o_vdata_valid <= 1'b0;
				r_dqm <= 2'b11;
				if (w_refr_req == 1'b1)
					r_state <= STATE_REFRESH;
				else if (r_vdata_req == 1'b1)
					r_state <= STATE_PRECH;
				else if (i_fifo_empty== 1'b0)
				begin
					r_state <= STATE_PRECH;
					r_fifo_next <= 1'b1;
				end
				r_addr <= { 12{1'b0} };
			end
		STATE_PRECH:
			begin
				r_state <= STATE_PRECH_NOP;
				r_cmd <= CMD_PRECHARGE;
				r_addr[AUTO_PRECHARGE] <= 1'b1;
				r_ba <= 2'b00;
				r_fifo_next <= 1'b0;
			end
		STATE_PRECH_NOP:
			begin
				r_state <= STATE_ACTIVATE;
				r_cmd <= CMD_NOP;
				r_wait <= (SDRAM_T_RP - 1);
				r_addr <= { 12{1'b0} };
				if (r_vdata_req == 1'b1)
				begin
					r_addr_tmp <= { {6{1'b0}}, r_video_addr[15], r_video_addr[7:0], r_video_addr[13:8], r_video_addr[14] };
					r_col_cnt <= 4'd15;
				end
					else
				begin
					r_write_low <= i_fifo_data[24];
					r_addr_tmp <= { {6{1'b0}}, i_fifo_data[23], i_fifo_data[15:8], i_fifo_data[21:16], i_fifo_data[22] };
					r_wr_data <= i_fifo_data[7:0];
				end
			end
		STATE_ACTIVATE:
			begin
				r_state <= STATE_ACTIVATE_NOP;
				r_cmd <= CMD_ACTIVE;
				r_addr <= r_addr_tmp[(SDRAM_ADDR_W-1-2)-:12];
				r_ba <= r_addr_tmp[(SDRAM_ADDR_W-1)-:2];
			end
		STATE_ACTIVATE_NOP:
			begin
				r_cmd <= CMD_NOP;
				if (r_vdata_req == 1'b1)
					r_state <= STATE_READ;
				else
					r_state <= STATE_WRITE;
				r_wait <= SDRAM_T_RCD;
			end
		STATE_READ:
			begin
				r_state <= STATE_READ_NOP;
				r_cmd <= CMD_READ;
				r_addr[11] <= 1'b0;
				r_addr[10] <= 1'b1;
				r_addr[9]  <= 1'b0;
				r_addr[8]  <= 1'b0;
				r_addr[7:0] <= r_addr_tmp[7:0];
				o_vdata_valid <= 1'b0;
				r_dqm <= 2'b00;
			end
		STATE_READ_NOP:
			begin
				r_state <= STATE_READ_DATA;
				r_cmd <= CMD_NOP;
				r_wait <= 2;
				r_addr_tmp[7:0] <= r_addr_tmp[7:0] + 8'd8;
			end
		STATE_READ_DATA:
			begin
				if (r_col_cnt == 8'd0)
					r_state <= STATE_IDLE;
				else
					r_state <= STATE_READ;
				r_col_cnt <= r_col_cnt - 1'b1;
				r_wait <= 7;
				o_vdata_valid <= 1'b1;
			end
		STATE_WRITE:
			begin
				r_state <= STATE_WRITE_NOP;
				r_cmd <= CMD_WRITE;
				r_addr[11] <= 1'b0;
				r_addr[10] <= 1'b1;
				r_addr[9]  <= 1'b0;
				r_addr[8]  <= 1'b0;
				r_addr[7:0] <= r_addr_tmp[7:0];
				r_dqm <= { r_write_low, r_write_low };
			end
		STATE_WRITE_NOP:
			begin
				r_state <= STATE_IDLE;
				r_cmd <= CMD_NOP;
				r_dqm <= 2'b11;
			end
		STATE_REFRESH:
			begin
				r_state <= STATE_REFRESH_NOP;
				r_cmd <= CMD_REFRESH;
				r_refr_reset <= 1'b1;
			end
		STATE_REFRESH_NOP:
			begin
				r_state <= STATE_IDLE;
				r_cmd <= CMD_NOP;
				r_refr_reset <= 1'b0;
				r_wait <= (SDRAM_T_RFC - 1);
			end
		endcase
	end
	
	assign o_CKE  = 1'b1;
	assign o_CSn  = r_cmd[3];
	assign o_RASn = r_cmd[2];
	assign o_CASn = r_cmd[1];
	assign o_WEn  = r_cmd[0];
	assign o_LDQM = r_dqm[0];
	assign o_UDQM = r_dqm[1];
	assign o_BS	  = r_ba;
	assign o_A	  = r_addr;
	assign o_vdata = io_dq;
	assign o_vdata_reset = r_vdata_req;
	assign o_fifo_read = r_fifo_next;
	
	assign io_dq = (r_state == STATE_WRITE_NOP) ? { r_wr_data, r_wr_data } : 16'hZZZZ;

endmodule
