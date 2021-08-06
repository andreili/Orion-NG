module pat_gen
(
	input		wire			i_clk,
	input		wire			i_reset_n,
	input		wire			i_afull,
	output	wire			o_wr_n,
	output	wire[15:0]	o_addr,
	output	wire			o_vmem_up_n,
	output	wire			o_vmem_lo_n,
	output	wire[7:0]	o_vmem_data
);

	reg[14:0]	r_cnt;

	always @(posedge i_clk)
	begin
		if (i_reset_n == 1'b0)
		begin
			r_cnt <= { 14{1'b0} };
			o_wr_n <= 1'b1;
			o_vmem_up_n <= 1'b1;
			o_vmem_lo_n <= 1'b0;
		end
			else if (r_cnt[14] == 1'b0)
		begin
			if (i_afull == 1'b0)
			begin
				r_cnt <= r_cnt + 1'b1;
				o_wr_n <= 1'b0;
			end
			else
				o_wr_n <= 1'b1;
		end
			else
		begin
			o_wr_n <= 1'b1;
		end
	end

	assign o_vmem_data =
		(r_cnt[2:0] == 3'd0) ? 8'b00000001 :
		(r_cnt[2:0] == 3'd1) ? 8'b00000011 :
		(r_cnt[2:0] == 3'd2) ? 8'b00000111 :
		(r_cnt[2:0] == 3'd3) ? 8'b00001111 :
		(r_cnt[2:0] == 3'd4) ? 8'b00011111 :
		(r_cnt[2:0] == 3'd5) ? 8'b00111111 :
		(r_cnt[2:0] == 3'd6) ? 8'b01111111 :
		8'b11111111;
	assign o_addr = { 2'b11, r_cnt[13:0] };

endmodule
