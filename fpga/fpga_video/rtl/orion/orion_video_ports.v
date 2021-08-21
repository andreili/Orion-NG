module video_ports
(
	input		wire			i_clk,
	// from Z80
	input		wire			i_reset_n,
	input		wire			i_iorq_n,
	input		wire			i_mreq_n,
	input		wire			i_rfsh_n,
	input		wire			i_wr_n,
	input		wire[15:0]	i_addr,
	input		wire[7:0]	i_data,
	// from video
	input		wire			i_frame_end,
	// to video
	output	wire			o_ps1_str,
	output	wire[2:0]	o_video_mode,
	output	wire[1:0]	o_video_bank,
	output	wire			o_ps_sel,
	output	wire			o_vb_sw,
	output	wire			o_wide_scr
);

wire			mr1;
wire			port_mem_en;
wire			port_io_en;
wire[255:0]	port_sel_mem;
wire[255:0]	port_sel_io_h;
wire			port_sel_io_l2;

reg[4:0]		r_video_mode;
reg[1:0]		r_vb_tmp;
reg			r_ctrl_o128;
reg			r_SR16;

assign mr1		= i_mreq_n | ~i_rfsh_n;

assign port_mem_en = ~mr1 & r_ctrl_o128;
assign port_sel_mem[8'hF8] = (i_addr[15:8]==8'hF8) ? port_mem_en : 1'b0;
assign port_sel_mem[8'hFA] = (i_addr[15:8]==8'hFA) ? port_mem_en : 1'b0;

assign port_io_en = ~i_iorq_n;
assign port_sel_io_h[8'hF8] = (i_addr[7:0]==8'hF8) ? port_io_en : 1'b0;
assign port_sel_io_h[8'hFA] = (i_addr[7:0]==8'hFA) ? port_io_en : 1'b0;
assign port_sel_io_h[8'hFC] = (i_addr[7:0]==8'hFC) ? port_io_en : 1'b0;
assign port_sel_io_l2 = (i_addr[7:2]==6'h02) ? port_io_en : 1'b0;

always @(posedge i_clk)
begin
	if (i_reset_n == 1'b0)
	begin
		r_video_mode <= '0;
		r_vb_tmp <= '0;
		r_SR16 <= '0;
		r_ctrl_o128 <= '0;
	end
		else if (i_wr_n == 1'b0)
	begin
		if ((port_sel_mem[8'hF8] == 1'b1) | (port_sel_io_h[8'hF8] == 1'b1))
			r_video_mode <= i_data[4:0];
		if ((port_sel_mem[8'hFA] == 1'b1) | (port_sel_io_h[8'hFA] == 1'b1))
		begin
			r_vb_tmp <= i_data[1:0];
			r_SR16 <= i_data[7];
		end
		if (port_sel_io_l2 == 1'b1)
			case (i_addr[1:0])
				2'b10 : r_ctrl_o128 <= i_data[7];
				default: ;
			endcase
	end
end

always @(posedge i_frame_end)
begin
	o_video_bank <= ~r_vb_tmp;
end

assign o_video_mode = 
	  ((r_video_mode[4]==1'b0) && (r_video_mode[2:0]==3'b000)) ? 3'h1
	: ((r_video_mode[4]==1'b0) && (r_video_mode[2:0]==3'b001)) ? 3'h2
	: ((r_video_mode[4]==1'b0) && (r_video_mode[2:0]==3'b100)) ? 3'h3
	: ((r_video_mode[4]==1'b0) && (r_video_mode[2:0]==3'b101)) ? 3'h4
	: ((r_video_mode[4]==1'b0) && (r_video_mode[2:1]==2'b11))  ? 3'h5
	: ((r_video_mode[4]==1'b1) && (r_video_mode[2]  ==1'b0))   ? 3'h6
	: ((r_video_mode[4]==1'b1) && (r_video_mode[2]  ==1'b1))   ? 3'h7
	: 3'h0;

assign o_ps_sel  = r_video_mode[3];
assign o_vb_sw   = r_video_mode[4];
assign o_ps1_str = ((port_sel_io_h[8'hFC]==1'b1) & (i_wr_n==1'b0)) ? 1'b0 : 1'b1;

endmodule 
