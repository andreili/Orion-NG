`default_nettype none

module wb_ram
#(
	parameter				DATA_WIDTH   	= 32,
	parameter				RAM_SIZE_WORD	= 1024
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
	output	wire			o_wb_ack,
	output	wire[31:0]	o_wb_dat
);

	localparam ADDR_WIDTH = $clog2(RAM_SIZE_WORD);

	wire valid;
	wire ram_wen;
	wire [3:0] wen; // write enable

	assign valid = i_wb_cyc & i_wb_stb;
	assign ram_wen = i_wb_we && valid;

	assign wen = i_wb_sel & {4{ram_wen}} ;

    /*
        Ack Generation
            - write transaction: asserted upon receiving adr_i & dat_i 
            - read transaction : asserted one clock cycle after receiving the adr_i & dat_i
    */ 

	reg wb_ack_read;

	always @(posedge i_wb_clk)
	begin
		if (i_wb_rst == 1'b1)
		begin
			wb_ack_read <= 1'b0;
			o_wb_ack <= 1'b0;
		end
			else
		begin
			// wb_ack_read <= {2{valid}} & {1'b1, wb_ack_read[1]};
			o_wb_ack    <= i_wb_we? (valid & !o_wb_ack): wb_ack_read;
			wb_ack_read <= (valid & !o_wb_ack) & !wb_ack_read;
		end
	end

`define BYTE_EN_SIZE(x) \
	(x <= 8) ? 1 : \
	(x <= 16) ? 2 : \
	(x <= 32) ? 4 : \
	8

	altsyncram
	RAM
	(
		.address_a			(i_wb_adr[(ADDR_WIDTH - 1 + 2):2]),
		.byteena_a			((|wen) ? wen : { `BYTE_EN_SIZE(DATA_WIDTH){1'b1} }),
		.clock0				(i_wb_clk),
		.data_a				(i_wb_dat),
		.wren_a				(ram_wen),
		.q_a					(o_wb_dat),
		.aclr0				(1'b0),
		.aclr1				(1'b0),
		.address_b			(1'b1),
		.addressstall_a	(1'b0),
		.addressstall_b	(1'b0),
		.byteena_b			(1'b1),
		.clock1				(1'b1),
		.clocken0			(1'b1),
		.clocken1			(1'b1),
		.clocken2			(1'b1),
		.clocken3			(1'b1),
		.data_b				(1'b1),
		.eccstatus			(),
		.q_b					(),
		.rden_a				(1'b1),
		.rden_b				(1'b1),
		.wren_b				(1'b0)
	);
	defparam
		RAM.byte_size = 8,
		RAM.clock_enable_input_a = "BYPASS",
		RAM.clock_enable_output_a = "BYPASS",
		RAM.intended_device_family = "Cyclone IV GX",
		RAM.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		RAM.lpm_type = "altsyncram",
		RAM.numwords_a = RAM_SIZE_WORD,
		RAM.operation_mode = "SINGLE_PORT",
		RAM.outdata_aclr_a = "NONE",
		RAM.outdata_reg_a = "UNREGISTERED",
		RAM.power_up_uninitialized = "FALSE",
		RAM.read_during_write_mode_port_a = "NEW_DATA_NO_NBE_READ",
		RAM.widthad_a = ADDR_WIDTH,
		RAM.width_a = DATA_WIDTH,
		RAM.width_byteena_a = `BYTE_EN_SIZE(DATA_WIDTH);

endmodule
`default_nettype wire
