module vmem_cap
(
	input		wire			i_clk_sdram,
	input		wire			i_clk_cpu,
	input		wire			i_wr_n,
	input		wire			i_mreq_n,
	output	wire			o_rw_req
);

	reg	r_clk0, r_clk1;
	reg	r_wrn0, r_wrn1;
	reg	r_mreqn0, r_mreqn1;

	always @(posedge i_clk_sdram)
	begin
		r_clk0 <= i_clk_cpu;
		r_clk1 <= r_clk0;
		r_wrn0 <= i_wr_n;
		r_wrn1 <= r_wrn0;
		r_mreqn0 <= i_mreq_n;
		r_mreqn1 <= r_mreqn0;
	end

	wire	w_clk_falling = (~r_clk0) & (r_clk1);
	wire	w_clk_rising = (r_clk0) & (~r_clk1);
	reg	r_wr_req;

	always @(posedge i_clk_sdram)
	begin
		if ((w_clk_rising == 1'b1) && (r_wrn1 == 1'b0) && (r_mreqn1 == 1'b0))
			r_wr_req <= 1'b1;
		else
			r_wr_req <= 1'b0;
	end

	assign o_rw_req = r_wr_req;

endmodule
