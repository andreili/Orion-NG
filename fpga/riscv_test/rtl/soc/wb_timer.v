`default_nettype none

module wb_timer
(
	input		wire			i_wb_clk,
	input		wire			i_wb_rst,

	input		wire[31:0]	i_wb_adr, 
	input		wire[31:0]	i_wb_dat,
	input		wire[3:0]	i_wb_sel,
	input		wire			i_wb_we,
	input		wire			i_wb_cyc,

	input		wire			i_wb_stb,
	output	reg			o_wb_ack,
	output	wire[31:0]	o_wb_dat
);

	wire w_req;
	wire w_write_req;
	wire w_read_req;

	assign w_req = i_wb_cyc & i_wb_stb;
	assign w_write_req = i_wb_we && w_req;
	assign w_read_req = (!i_wb_we) && w_req;

	reg wb_ack_read;

	always @(posedge i_wb_clk)
	begin
		if (i_wb_rst == 1'b1)
			o_wb_ack <= 1'b0;
		else
			o_wb_ack <= w_req;
	end

	reg			r_cnt_enable;
	reg[30:0]	r_cnt_div;
	reg[30:0]	r_div_value;
	reg[31:0]	r_cnt_value;
	reg[31:0]	r_data_out;

	always @(posedge i_wb_clk)
	begin
		if (i_wb_rst == 1'b1)
		begin
			r_cnt_enable <= 1'b0;
			r_cnt_div <= { 31{1'b0} };
			r_div_value <= { 31{1'b0} };
			r_cnt_value <= { 32{1'b0} };
		end
			else if (w_write_req && (i_wb_adr[3:2] == 2'b00))
		begin
			r_cnt_enable <= i_wb_dat[31];
			r_cnt_div <= i_wb_dat[30:0];
		end
			else if (w_write_req && (i_wb_adr[3:2] == 2'b01))
		begin
			r_cnt_value <= i_wb_dat;
		end
			else if (r_cnt_enable)
		begin
			r_div_value <= r_div_value - 1'b1;
			if (r_div_value == { 31{1'b0} })
			begin
				r_div_value <= r_cnt_div;
				r_cnt_value <= r_cnt_value + 1'b1;
			end
		end
	end

	always @(posedge i_wb_clk)
	begin
		if (w_read_req)
			case (i_wb_adr[3:2])
				2'b00: r_data_out <= { r_cnt_enable, r_cnt_div};
				2'b01: r_data_out <= r_cnt_value;
				default: r_data_out <= { 32{1'b0} };
			endcase
	end

	assign o_wb_dat = r_data_out;

endmodule

`default_nettype wire
