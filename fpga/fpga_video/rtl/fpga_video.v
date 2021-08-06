`timescale 1 ps / 1 ps

module fpga_video
(
	input		wire			clk,
	//
	input		wire			btn,
	output	wire[2:0]	led,
	// configuration FLASH
	output	wire			FLASH_ASDO,
	output	wire			FLASH_CSO,
	output	wire			FLASH_DCLK,
	input		wire			FLASH_DATA0,
	// SDRAM
	inout		wire[15:0]	SDRAM_DQ,
	output	wire[12:0]	SDRAM_A,
	output	wire[1:0]	SDRAM_BS,
	output	wire			SDRAM_CSn,
	output	wire			SDRAM_CKE,
	output	wire			SDRAM_CLK,
	output	wire			SDRAM_LDQM,
	output	wire			SDRAM_UDQM,
	output	wire			SDRAM_WEn,
	output	wire			SDRAM_CASn,
	output	wire			SDRAM_RASn,
	// video output
	output	wire[7:0]	VO_R,
	output	wire[7:0]	VO_G,
	output	wire[7:0]	VO_B,
	output	wire			VO_HS,
	output	wire			VO_VS,
	output	wire			VO_CLK,
	output	wire			VO_DE,
	// SPI interface to MCU
	input		wire			SPI_SCK,
	output	wire			SPI_SO,
	input		wire			SPI_SI,
	input		wire			SPI_CSn,
	// unused GPIO
	output	wire[7:0]	EXT0,
	output	wire[5:0]	EXT1,
	input		wire			RESET_N,
	output	wire			EXT2_1,
	output	wire			EXT2_2,
	output	wire			EXT2_4,
	output	wire[7:0]	EXT3,
	output	wire			IO0_0,
	output	wire			IO0_1,
	output	wire			IO0_3,
	output	wire			IO1_14
);

	wire w_clk_sdram, w_clk_spi, w_clk_low;
	wire w_reset_n;

	pll_core u_pll_core
	(
		.inclk0		(clk),
		.c0			(w_clk_sdram),	// 133
		.c1			(w_clk_spi),		// 38
		.c2			(w_clk_low)		// 1
	);

	reset
	#(
		.WIDTH				(10)
	)
	u_board_reset
	(
		.i_clk				(w_clk_low),
		.i_reset_in_n		(btn & RESET_N),
		.o_reset_out_n		(w_reset_n)
	);

	wire[6:0]	w_addr;
	wire[7:0]	w_data_wr, w_data_rd;
	wire			w_wr_req;
	wire			w_sel_vctrl, w_sel_pllctrl;
	wire[7:0]	w_data_wr_vctrl, w_data_wr_pll;
	wire			w_vclk2;
	
	spi_master u_master
	(
		.i_clk			(w_clk_spi),
		.i_reset_n		(w_reset_n),
		.i_spi_cs_n		(SPI_CSn),
		.i_spi_sck		(SPI_SCK),
		.i_spi_si		(SPI_SI),
		.o_spi_so		(SPI_SO),
		.o_addr			(w_addr),
		.o_data_wr		(w_data_wr),
		.i_data_rd		(w_data_rd),
		.o_wr_req		(w_wr_req)
	);
	
	slave_mux u_mux
	(
		.i_addr			(w_addr),
		.o_data_wr		(w_data_rd),
		.o_sel0			(w_sel_vctrl),
		.i_data_wr0		(w_data_wr_vctrl),
		.o_sel1			(w_sel_pllctrl),
		.i_data_wr1		(w_data_wr_pll),
		.o_sel2			(),
		.i_data_wr2		(8'h00),
		.o_sel3			(),
		.i_data_wr3		(8'h00)
	);

	pll_cfg u_pll_cfg
	(
		.i_clk			(w_clk_spi),
		.i_reset_n		(w_reset_n),
		.i_addr			(w_addr[4:0]),
		.i_data_wr		(w_data_wr),
		.i_select		(w_sel_pllctrl),
		.i_wr_req		(w_wr_req),
		.o_data_wr		(w_data_wr_pll),
		.i_clk_raw		(clk),
		.o_clk			(VO_CLK),
		.o_clk2			(w_vclk2)
	);
	
	wire[7:0]	w_line_idx;
	wire[31:0]	w_vdata;
	wire[15:0]	w_vdata_tmp;
	wire			w_line_end, w_vdata_valid, w_vdata_reset;
	wire[5:0]	w_column;
	
	vmem u_vmem
	(
		.i_clk_mem		(w_clk_sdram),
		.i_clk_vo		(VO_CLK),
		.i_vdata_valid	(w_vdata_valid),
		.i_vdata_reset	(w_vdata_reset),
		.i_vdata			(w_vdata_tmp),
		.i_column		(w_column),
		.o_vdata			(w_vdata)
	);

	video u_video
	(
		.i_clk			(VO_CLK),
		.i_clk2			(w_vclk2),
		.i_reset_n		(w_reset_n),
		.i_clk_bus		(w_clk_spi),
		.i_addr			(w_addr[4:0]),
		.i_data_wr		(w_data_wr),
		.i_select		(w_sel_vctrl),
		.i_wr_req		(w_wr_req),
		.o_data_wr		(w_data_wr_vctrl),
		.i_wide_screen	(1'b1),
		.i_video_mode	(3'b000),
		.o_line_idx		(w_line_idx),
		.o_line_end		(w_line_end),
		.o_column		(w_column),
		.i_vdata			(w_vdata),
		.o_r				(VO_R),
		.o_g				(VO_G),
		.o_b				(VO_B),
		.o_hs				(VO_HS),
		.o_vs				(VO_VS),
		.o_de				(VO_DE)
	);

	wire[24:0]			w_data_to_fifo;
	wire[24:0]			w_data_from_fifo;
	wire					w_fifo_empty;
	wire					w_fifo_afull;
	wire					w_fifo_rdreq;
	wire					w_wr_n;

	wr_fifo u_wr_fifo
	(
		.clock			(w_clk_sdram),
		.data				(w_data_to_fifo),
		.rdreq			(w_fifo_rdreq),
		.wrreq			(~w_wr_n),
		.almost_full	(w_fifo_afull),
		.empty			(w_fifo_empty),
		.full				(),
		.q					(w_data_from_fifo)
	);
	
	pat_gen u_gen
	(
		.i_clk			(w_clk_sdram),
		.i_reset_n		(w_reset_n),
		.i_afull			(w_fifo_afull),
		.o_wr_n			(w_wr_n),
		.o_addr			(w_data_to_fifo[23:8]),
		.o_vmem_up_n	(),
		.o_vmem_lo_n	(w_data_to_fifo[24]),
		.o_vmem_data	(w_data_to_fifo[7:0])
	);

	sdram_ctrl
	#(
		.SDRAM_MHZ		(72)
	)
	u_sdram
	(
		.i_clk			(w_clk_sdram),
		.i_reset_n		(w_reset_n),
		.io_dq			(SDRAM_DQ),
		.o_A				(SDRAM_A[11:0]),
		.o_BS				(SDRAM_BS),
		.o_CSn			(SDRAM_CSn),
		.o_CKE			(SDRAM_CKE),
		.o_LDQM			(SDRAM_LDQM),
		.o_UDQM			(SDRAM_UDQM),
		.o_WEn			(SDRAM_WEn),
		.o_CASn			(SDRAM_CASn),
		.o_RASn			(SDRAM_RASn),
		.i_fifo_empty	(w_fifo_empty),
		.i_fifo_data	(w_data_from_fifo),
		.o_fifo_read	(w_fifo_rdreq),
		.i_line_idx		(w_line_idx),
		.i_line_end		(w_line_end),
		.o_vdata_valid	(w_vdata_valid),
		.o_vdata_reset	(w_vdata_reset),
		.o_vdata			(w_vdata_tmp)
	);


// unused GPIO
assign IO0_0 	= 1'b0;
assign IO0_1 	= 1'b0;
assign IO0_3 	= 1'b0;
assign IO1_14	= 1'b0;
assign EXT0		= 8'b0;
assign EXT1		= 6'b0;
assign EXT2_0	= 1'b0;
assign EXT2_1	= 1'b0;
assign EXT2_2	= 1'b0;
assign EXT2_4	= 1'b0;
assign EXT3		= 8'b0;

assign FLASH_ASDO = 1'b0;
assign FLASH_CSO = 1'b0;
assign FLASH_DCLK = 1'b0;

assign SDRAM_CLK = ~w_clk_sdram;
assign SDRAM_A[12] = 1'b0;

endmodule
