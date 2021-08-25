`default_nettype none

module wb_rom
#(
	parameter				DATA_WIDTH   	= 32,
	parameter				ROM_SIZE_WORD	= 1024
)
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

	localparam	ADDR_WIDTH = $clog2(ROM_SIZE_WORD);

	wire valid = i_wb_cyc & i_wb_stb;

    /*
        Ack Generation
            - write transaction: asserted upon receiving adr_i & dat_i 
            - read transaction : asserted one clock cycle after receiving the adr_i & dat_i
    */

	always @(posedge i_wb_clk)
	begin
		if (i_wb_rst == 1'b1)
		begin
			o_wb_ack <= 1'b0;
		end
			else
		begin
			//o_wb_ack 	<= (valid & !o_wb_ack) ;
			o_wb_ack    <= i_wb_we? 1'b0: (valid & !o_wb_ack);
		end
	end

`define BYTE_EN_SIZE(x) \
	(x <= 8) ? 1 : \
	(x <= 16) ? 2 : \
	(x <= 32) ? 4 : \
	8
 
	altsyncram
	ROM
	(
		.address_a			(i_wb_adr[(ADDR_WIDTH - 1 + 2):2]),
		.clock0				(i_wb_clk),
		.q_a					(o_wb_dat),
		.aclr0				(1'b0),
		.aclr1				(1'b0),
		.address_b			(1'b1),
		.addressstall_a	(1'b0),
		.addressstall_b	(1'b0),
		.byteena_a			({ `BYTE_EN_SIZE(DATA_WIDTH){1'b1} }),
		.byteena_b			(1'b1),
		.clock1				(1'b1),
		.clocken0			(1'b1),
		.clocken1			(1'b1),
		.clocken2			(1'b1),
		.clocken3			(1'b1),
		.data_a				({32{1'b1}}),
		.data_b				(1'b1),
		.eccstatus			(),
		.q_b					(),
		.rden_a				(valid),
		.rden_b				(1'b1),
		.wren_a				(1'b0),
		.wren_b				(1'b0)
	);
	defparam
		ROM.address_aclr_a = "NONE",
		ROM.clock_enable_input_a = "BYPASS",
		ROM.clock_enable_output_a = "BYPASS",
		ROM.init_file = "./ROMs/test.mif",
		ROM.intended_device_family = "Cyclone IV GX",
		ROM.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		ROM.lpm_type = "altsyncram",
		ROM.numwords_a = ROM_SIZE_WORD,
		ROM.operation_mode = "ROM",
		ROM.outdata_aclr_a = "NONE",
		ROM.outdata_reg_a = "UNREGISTERED",
		ROM.widthad_a = ADDR_WIDTH,
		ROM.width_a = DATA_WIDTH,
		ROM.width_byteena_a = `BYTE_EN_SIZE(DATA_WIDTH);

endmodule

`default_nettype wire
