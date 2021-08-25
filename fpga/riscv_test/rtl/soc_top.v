module soc_top
(
	input		wire			clk_25,
	input		wire			clk_100,
	input		wire			clk_usr,
	input		wire			btn1,
	input		wire			btn2,
	output	wire[3:0]	led,
	//
	input		wire			ext_reset_n,
	input		wire			uart_rx,
	output	wire			uart_tx
);

	wire w_clk_cpu, w_clk_low;
	wire w_porb_n, w_reset_n;

	pll_core u_pll_core
	(
		.inclk0		(clk_25),
		.c0			(w_clk_cpu),
		.c1			(w_clk_low)
	);

	reset
	#(
		.WIDTH				(10)
	)
	u_board_reset
	(
		.i_clk				(w_clk_low),
		.i_reset_in_n		(1'b1),
		.o_reset_out_n		(w_porb_n)
	);

	reset
	#(
		.WIDTH				(10)
	)
	u_reset
	(
		.i_clk				(w_clk_low),
		.i_reset_in_n		(btn1 & ext_reset_n),
		.o_reset_out_n		(w_reset_n)
	);

	wire w_soc_trap;

	soc
	u_soc
	(
		.i_clk				(w_clk_cpu),
		.i_reset_n			(w_reset_n),
		.o_trap				(w_soc_trap),
		.o_uart_rx			(uart_rx),
		.o_uart_tx			(uart_tx)
	);

	assign led[0] = w_soc_trap;
	assign led[1] = 1'b0;
	assign led[2] = 1'b0;
	assign led[3] = 1'b0;

endmodule
