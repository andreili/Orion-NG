`include "caravel/defines.v"

module top
(
	input		wire			clk_25,
	input		wire			clk_100,
	input		wire			clk_usr,

	inout		wire			gpio,			// Used for external LDO control
   inout		wire[`MPRJ_IO_PADS-1:0] mprj_io,
	inout		wire[`MPRJ_IO_PADS-1:0] mngm_io,
   output	wire[`MPRJ_PWR_PADS-1:0] pwr_ctrl_out,

   // Note that only two pins are available on the flash so dual and
   // quad flash modes are not available.

   output	wire 			flash_csb,
   output	wire 			flash_clk,
   inout		wire 			flash_io0,
   inout		wire 			flash_io1,
	//
	input		wire			ext_reset_n,
	input		wire			btn1,
	input		wire			btn2,
	output	wire[3:0]	led
);

	wire w_clk_sdram, w_clk_cpu, w_clk_cpu90, w_clk_low;
	wire w_reset_n, w_porb_n;

	pll_core u_pll_core
	(
		.inclk0		(clk_25),
		.c0			(w_clk_cpu),
		.c1			(w_clk_cpu90),
		.c2			(w_clk_low)//,
		//.c3			(w_clk_init)
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
		.i_reset_in_n		(btn2 & ext_reset_n),
		.o_reset_out_n		(w_reset_n)
	);
	
	wire flash_io0_oeb, flash_io1_oeb;
	wire flash_io0_do, flash_io1_do;
	
	assign flash_io0 = (flash_io0_oeb == 1'b0) ? flash_io0_do : 1'bZ;
	assign flash_io1 = (flash_io1_oeb == 1'b0) ? flash_io1_do : 1'bZ;
	wire [2:0]   user_irq;
	wire [127:0] la_data_in;
	wire [127:0] la_data_out;
	wire [127:0] la_oenb;
	wire [127:0] la_iena;
	wire 	    mprj_cyc_o;
	wire 	    mprj_stb_o;
	wire 	    mprj_we_o;
	wire [3:0]  mprj_sel_o;
	wire [31:0] mprj_adr_o;
	wire [31:0] mprj_dat_o;
	wire mprj_ack_i;
	wire [31:0] mprj_dat_i;
	//wire[`MPRJ_IO_PADS-1:0] mngm_io;

	// Storage area
	// Management R/W interface
	wire [`RAM_BLOCKS-1:0] mgmt_ena;
    wire [`RAM_BLOCKS-1:0] mgmt_wen;
    wire [(`RAM_BLOCKS*4)-1:0] mgmt_wen_mask;
    wire [7:0] mgmt_addr;
    wire [31:0] mgmt_wdata;
    wire [(`RAM_BLOCKS*32)-1:0] mgmt_rdata;
	// Management RO interface
	wire mgmt_ena_ro;
    wire [7:0] mgmt_addr_ro;
    wire [31:0] mgmt_rdata_ro;

    // SoC core
    wire caravel_clk;
    wire caravel_clk2;
    wire caravel_rstn;


    mgmt_core soc (
		// GPIO (1 pin)
		.gpio_out_pad(),
		.gpio_in_pad(),
		.gpio_mode0_pad(),
		.gpio_mode1_pad(),
		.gpio_outenb_pad(),
		.gpio_inenb_pad(),
		// Primary SPI flash controller
		.flash_csb(flash_csb),
		.flash_clk(flash_clk),
		.flash_csb_oeb(),
		.flash_clk_oeb(),
		.flash_io0_oeb(flash_io0_oeb),
		.flash_io1_oeb(flash_io1_oeb),
		.flash_csb_ieb(),
		.flash_clk_ieb(),
		.flash_io0_ieb(),
		.flash_io1_ieb(),
		.flash_io0_do(flash_io0_do),
		.flash_io1_do(flash_io1_do),
		.flash_io0_di(flash_io0),
		.flash_io1_di(flash_io1),
		// Master Reset
		.resetb(w_reset_n),
		.porb(!w_porb_n),
		// Clocks and reset
		//.clock(w_clk_init),
		.pll_clk(w_clk_cpu),
		.pll_clk90(w_clk_cpu90),
        	.core_clk(caravel_clk),
        	.user_clk(caravel_clk2),
        	.core_rstn(caravel_rstn),
		// IRQ
		.user_irq(user_irq),
		.user_irq_ena(),
		// Logic Analyzer
		.la_input(la_data_in),
		.la_output(la_data_out),
		.la_oenb(la_oenb),
		.la_iena(la_iena),
		// User Project IO Control
		.mprj_vcc_pwrgood(),
		.mprj2_vcc_pwrgood(),
		.mprj_vdd_pwrgood(),
		.mprj2_vdd_pwrgood(),
		.mprj_io_loader_resetn(),
		.mprj_io_loader_clock(),
		.mprj_io_loader_data_1(),
		.mprj_io_loader_data_2(),
		.mgmt_in_data(mngm_io),
		.mgmt_out_data(mngm_io),
		.pwr_ctrl_out(pwr_ctrl_out),
		//.sdo_out(sdo_out),
		//.sdo_outenb(sdo_outenb),
		//.jtag_out(jtag_out),
		//.jtag_outenb(jtag_outenb),
		.flash_io2_do(),
		.flash_io3_do(),
		.flash_io2_oeb(),
		.flash_io3_oeb(),
		// User Project Slave ports (WB MI A)
		.mprj_cyc_o(mprj_cyc_o),
		.mprj_stb_o(mprj_stb_o),
		.mprj_we_o(mprj_we_o),
		.mprj_sel_o(mprj_sel_o),
		.mprj_adr_o(mprj_adr_o),
		.mprj_dat_o(mprj_dat_o),
		.mprj_ack_i(mprj_ack_i),
		.mprj_dat_i(mprj_dat_i),
		// mask data
		.mask_rev(32'h_baad_f00d),
		// MGMT area R/W interface
    		.mgmt_ena(mgmt_ena),
    		.mgmt_wen_mask(mgmt_wen_mask),
    		.mgmt_wen(mgmt_wen),
    		.mgmt_addr(mgmt_addr),
    		.mgmt_wdata(mgmt_wdata),
    		.mgmt_rdata(mgmt_rdata),
    		// MGMT area RO interface
    		.mgmt_ena_ro(mgmt_ena_ro),
    		.mgmt_addr_ro(mgmt_addr_ro),
    		.mgmt_rdata_ro(mgmt_rdata_ro)
    	);

    wire [`MPRJ_IO_PADS-1:0] user_io_oeb;
    wire [`MPRJ_IO_PADS-1:0] user_io_in;
    wire [`MPRJ_IO_PADS-1:0] user_io_out;
	 
	 assign user_io_in = mprj_io;
    genvar iS;
    generate
        for (iS = 0; iS < `MPRJ_IO_PADS; iS = iS + 1) begin : gen_aab
            assign mprj_io[iS] = (user_io_oeb[iS] == 1'b0) ? user_io_out[iS] : 1'bZ;
        end
    endgenerate

	user_project_wrapper mprj ( 
    		.wb_clk_i(caravel_clk),
    		.wb_rst_i(caravel_rstn),
		// MGMT SoC Wishbone Slave
		.wbs_cyc_i(mprj_cyc_o),
		.wbs_stb_i(mprj_stb_o),
		.wbs_we_i(mprj_we_o),
		.wbs_sel_i(mprj_sel_o),
	    	.wbs_adr_i(mprj_adr_o),
		.wbs_dat_i(mprj_dat_o),
	    	.wbs_ack_o(mprj_ack_i),
		.wbs_dat_o(mprj_dat_i),
		// Logic Analyzer
		.la_data_in(la_data_in),
		.la_data_out(la_data_out),
		.la_oenb(la_oenb),
		// IO Pads
		.io_in (user_io_in),
    		.io_out(user_io_out),
    		.io_oeb(user_io_oeb),
		.analog_io(),
		// Independent clock
		.user_clock2(caravel_clk2),
		// IRQ
		.user_irq(user_irq)
	);

	// Storage area
	/*storage storage(
		.mgmt_clk(caravel_clk),
        .mgmt_ena(mgmt_ena),
        .mgmt_wen(mgmt_wen),
        .mgmt_wen_mask(mgmt_wen_mask),
        .mgmt_addr(mgmt_addr),
        .mgmt_wdata(mgmt_wdata),
        .mgmt_rdata(mgmt_rdata),
        // Management RO interface
        .mgmt_ena_ro(mgmt_ena_ro),
        .mgmt_addr_ro(mgmt_addr_ro),
        .mgmt_rdata_ro(mgmt_rdata_ro)
	);*/

endmodule
