module soc
#(
	parameter	[31:0]	MEM_WORDS		= 1024,
	parameter	[31:0]	STACKADDR		= (4*(MEM_WORDS)),
	parameter	[31:0]	PER_ADDR_ROM  	= 32'h 0000_0000,
	parameter	[31:0]	PER_ADDR_RAM  	= 32'h 1000_0000,
	parameter	[31:0]	PER_ADDR_UART  = 32'h 2000_0000,
	parameter	[31:0]	PER_ADDR_I2C  	= 32'h 3000_0000,
	parameter	[31:0]	PER_ADDR_TIM0 	= 32'h 4000_0000,
	parameter	[31:0]	PROGADDR_RESET = PER_ADDR_ROM,
	parameter	[31:0]	PROGADDR_IRQ   = (PER_ADDR_ROM + 32'h_0000_0010),
	parameter				DATA_WIDTH   	= 32,
	parameter				ADDR_WIDTH   	= 32,
	parameter				ROM_SIZE_WORD	= 8192,
	parameter				RAM_SIZE_WORD	= 1024
)
(
	input		wire			i_clk,
	input		wire			i_reset_n,
	// status
	output	wire			o_trap,
	// peripheral
	input		wire			o_uart_rx,
	output	wire			o_uart_tx
);

localparam		NUM_SLAVES = 5;

	wire w_wb_clk 			= i_clk;
	wire w_wb_rst 			= ~i_reset_n;
	// Wishbone Master
	wire[31:0]	w_wb_adr;
	wire[31:0]	w_wb_dat_rd;
	wire[3:0]	w_wb_sel;
	wire			w_wb_we;
	wire			w_wb_cyc;
	wire			w_wb_stb;
	wire[31:0]	w_wb_dat_wr;
	wire			w_wb_ack;
	//wire[31:0]	w_irq;
    
	picorv32_wb
	#(
		.STACKADDR			(STACKADDR),
		.PROGADDR_RESET	(PROGADDR_RESET),
		.PROGADDR_IRQ		(PROGADDR_IRQ),
		.BARREL_SHIFTER	(1),
		.COMPRESSED_ISA	(1),
		.ENABLE_MUL			(1),
		.ENABLE_DIV			(1),
		.ENABLE_IRQ			(0),
		.ENABLE_IRQ_QREGS	(0)
	)
	u_cpu
	(
		.wb_clk_i 			(w_wb_clk),
		.wb_rst_i 			(w_wb_rst),
		.trap     			(o_trap),
		.irq      			(),
		.mem_instr			(),
		.wbm_adr_o			(w_wb_adr),     
		.wbm_dat_i			(w_wb_dat_rd),    
		.wbm_stb_o			(w_wb_stb),    
		.wbm_ack_i			(w_wb_ack),    
		.wbm_cyc_o			(w_wb_cyc),    
		.wbm_dat_o			(w_wb_dat_wr),    
		.wbm_we_o			(w_wb_we),      
		.wbm_sel_o			(w_wb_sel)     
	);

	// Wishbone Interconnect 
	localparam [NUM_SLAVES*8-1: 0] ADR_MASK = {
		{8'hFF},
		{8'hFF},
		{8'hFF},
		{8'hFF},
		{8'hFF}
	};

	localparam [NUM_SLAVES*8-1: 0] SLAVE_ADR = {
		{PER_ADDR_ROM[(ADDR_WIDTH-1)-:8]},
		{PER_ADDR_RAM[(ADDR_WIDTH-1)-:8]},
		{PER_ADDR_UART[(ADDR_WIDTH-1)-:8]},
		{PER_ADDR_I2C[(ADDR_WIDTH-1)-:8]},
		{PER_ADDR_TIM0[(ADDR_WIDTH-1)-:8]}
	};

	wire			w_rom_stb;
	wire[31:0]	w_rom_dat_rd;
	wire			w_rom_ack;

	wire			w_ram_stb;
	wire[31:0]	w_ram_dat_rd;
	wire			w_ram_ack;

	wire			w_uart_stb;
	wire[31:0]	w_uart_dat_rd;
	wire			w_uart_ack;

	wire			w_i2c_stb;
	wire[31:0]	w_i2c_dat_rd;
	wire			w_i2c_ack;

	wire			w_tim0_stb;
	wire[31:0]	w_tim0_dat_rd;
	wire			w_tim0_ack;

	// Wishbone intercon logic
	wb_intercon
	#(
		.AW					(ADDR_WIDTH),
		.DW					(DATA_WIDTH),
		.NS					(NUM_SLAVES),
		.BW					(8),
		.BS					(ADDR_WIDTH-1),
		.ADR_MASK			(ADR_MASK),
		.SLAVE_ADR			(SLAVE_ADR)
	)
	u_ic
	(
		// Master Interface
		.i_wbm_adr			(w_wb_adr),
		.i_wbm_stb			(w_wb_stb),
		.o_wbm_dat			(w_wb_dat_rd),
		.o_wbm_ack			(w_wb_ack),

		// Slaves Interface
		.o_wbs_stb			({
									w_rom_stb, 		w_ram_stb, 		w_uart_stb, 	w_i2c_stb,
									w_tim0_stb
								 }), 
		.i_wbs_dat			({
									w_rom_dat_rd, 	w_ram_dat_rd, 	w_uart_dat_rd, w_i2c_dat_rd,
									w_tim0_dat_rd
								 }),
		.i_wbs_ack			({
									w_rom_ack,		w_ram_ack,		w_uart_ack,		w_i2c_ack,
									w_wb_ack
								 })
	);

	wb_rom
	#(
		.DATA_WIDTH 		(DATA_WIDTH),
		.ROM_SIZE_WORD		(ROM_SIZE_WORD)
	)
	u_rom
	(
		.i_wb_clk			(w_wb_clk),
		.i_wb_rst			(w_wb_rst),
		.i_wb_adr			(w_wb_adr), 
		.i_wb_dat			(w_wb_dat_wr),
		.i_wb_sel			(w_wb_sel),
		.i_wb_we				(w_wb_we),
		.i_wb_cyc			(w_wb_cyc),

		.i_wb_stb			(w_rom_stb),
		.o_wb_ack			(w_rom_ack),
		.o_wb_dat			(w_rom_dat_rd)
	);

	wb_ram
	#(
		.DATA_WIDTH 		(DATA_WIDTH),
		.RAM_SIZE_WORD		(RAM_SIZE_WORD)
	)
	u_ram
	(
		.i_wb_clk			(w_wb_clk),
		.i_wb_rst			(w_wb_rst),
		.i_wb_adr			(w_wb_adr), 
		.i_wb_dat			(w_wb_dat_wr),
		.i_wb_sel			(w_wb_sel),
		.i_wb_we				(w_wb_we),
		.i_wb_cyc			(w_wb_cyc),

		.i_wb_stb			(w_ram_stb),
		.o_wb_ack			(w_ram_ack),
		.o_wb_dat			(w_ram_dat_rd)
	);

	/*simpleuart_wb #(
		.BASE_ADR(PER_ADDR_UART),
		.CLK_DIV(8'h00),
		.DATA(8'h04)
	) simpleuart (
		// Wishbone Interface
		.wb_clk_i(w_wb_clk),
		.wb_rst_i(w_wb_rst),

		.wb_adr_i(w_wb_adr),      
		.wb_dat_i(w_wb_dat_wr),
		.wb_sel_i(w_wb_sel),
		.wb_we_i(w_wb_we),
		.wb_cyc_i(w_wb_cyc),

		.wb_stb_i(w_uart_stb),
		.wb_ack_o(w_uart_ack),
		.wb_dat_o(w_uart_dat_rd),

		.ser_tx(o_uart_tx),
		.ser_rx(o_uart_rx)
	);*/
 
	wbuart
	#(
		.HARDWARE_FLOW_CONTROL_PRESENT	(1'b0)
	)
	u_uart
	(
		.i_clk					(w_wb_clk),
		.i_rst					(w_wb_rst),
		//
		.i_wb_cyc				(w_wb_cyc),
		.i_wb_stb				(w_uart_stb),
		.i_wb_we					(w_wb_we),
		.i_wb_addr				(w_wb_adr[3:2]),
		.i_wb_data				(w_wb_dat_wr),
		.o_wb_ack				(w_uart_ack),
		.o_wb_stall				(),
		.o_wb_data				(w_uart_dat_rd),
		//
		.i_uart_rx				(o_uart_rx),
		.o_uart_tx				(o_uart_tx),
		//
		.o_uart_rx_int			(),		// rx fifo not empty
		.o_uart_tx_int			()			// tx fifo not full
	);

	/*wire	w_scl_oe, w_scl_o, w_sda_oe, w_sda_o;
	block u_i2c
	(
		.wb_clk_i				(w_wb_clk),
		.wb_rst_i				(w_wb_rst),
		//
		.wb_add_i				(w_wb_adr[8:1]),
		.wb_data_i				(w_wb_dat_wr[7:0]),
		.wb_we_i					(w_wb_we),
		.wb_cyc_i				(w_wb_cyc),
		//
		.wb_stb_i				(w_i2c_stb),
		.wb_ack_o				(w_i2c_ack),
		.wb_data_o				(w_i2c_dat_rd[7:0]),
		//
		.irq						(),
		.trans_comp				(),
		//
		.scl_oe					(w_scl_oe),
		.scl_in					(o_i2c_scl),
		.scl_o					(w_scl_o),
		.sda_oe					(w_sda_oe),
		.sda_in					(o_i2c_sda),
		.sda_o					(w_sda_o)
	);
	assign w_i2c_dat_rd[31:8] = { 24{1'b0} };
	assign o_i2c_scl = w_scl_oe ? w_scl_o : 1'bZ;
	assign o_i2c_sda = w_sda_oe ? w_sda_o : 1'bZ;*/
 
	wb_timer
	u_tim0
	(
		.i_wb_clk				(w_wb_clk),
		.i_wb_rst				(w_wb_rst),
		//
		.i_wb_adr				(w_wb_adr[3:2]),
		.i_wb_dat				(w_wb_dat_wr),
		.i_wb_sel				(w_wb_sel),
		.i_wb_we					(w_wb_we),
		.i_wb_cyc				(w_wb_cyc),
		//
		.i_wb_stb				(w_tim0_stb),
		.o_wb_ack				(w_tim0_ack),
		.o_wb_dat				(w_tim0_dat_rd)
	);

endmodule
