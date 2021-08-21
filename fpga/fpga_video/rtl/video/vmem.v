module vmem
(
	input		wire			i_clk_mem,
	input		wire			i_clk_vo,
	input		wire			i_vdata_valid,
	input		wire			i_vdata_reset,
	input		wire[15:0]	i_vdata,
	input		wire[5:0]	i_column,
	output	wire[31:0]	o_vdata
);

	reg[6:0]		r_wr_cnt;

	always @(posedge i_clk_mem)
	begin
		if (i_vdata_reset == 1'b1)
			r_wr_cnt <= 7'b0;
		else if (i_vdata_valid == 1'b1)
			r_wr_cnt <= r_wr_cnt + 1'b1;
	end

	vram u_vram
	(
		.data				(i_vdata),
		.wraddress		(r_wr_cnt),
		.wrclock			(i_clk_mem),
		.wren				(i_vdata_valid),
		.rdaddress		(i_column),
		.rdclock			(i_clk_vo),
		.q					(o_vdata)
	);

endmodule
