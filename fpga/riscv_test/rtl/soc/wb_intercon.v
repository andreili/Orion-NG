`default_nettype none
module wb_intercon
#(
	parameter DW = 32,          // Data Width
	parameter AW = 32,          // Address Width
	parameter NS = 6,           // Number of Slaves
	parameter BW = 8,           // Decode bits count from address
	parameter BS = 31,          // Decode bits start offset on address
	parameter [NS*BW-1: 0] ADR_MASK,
	parameter [NS*BW-1: 0] SLAVE_ADR
)
(
	// Master Interface
	input		wire[AW-1:0]		i_wbm_adr,
	input		wire					i_wbm_stb,

	output	reg[DW-1:0]			o_wbm_dat,
	output	wire					o_wbm_ack,

	// Slave Interface
	input		wire[NS*DW-1:0]	i_wbs_dat,
	input		wire[NS-1:0]		i_wbs_ack,
	output	wire[NS-1:0]		o_wbs_stb
);
    
	wire[NS-1: 0]	w_slave_sel;

	// Address decoder
	genvar iS;
	generate
		for (iS = 0; iS < NS; iS = iS + 1) begin : gen_sel
			assign w_slave_sel[iS] = ((i_wbm_adr[BS-:BW] & ADR_MASK[(iS+1)*BW-1:iS*BW]) == SLAVE_ADR[(iS+1)*BW-1:iS*BW]);
		end
	endgenerate

	// Data-out Assignment
	assign o_wbm_ack = |(i_wbs_ack & w_slave_sel);
	assign o_wbs_stb = { NS{i_wbm_stb} } & w_slave_sel;

	integer i;
	always @(*)
	begin
		o_wbm_dat = { DW{1'b0} };
		for (i=0; i<(NS*DW); i=i+1)
			o_wbm_dat[i%DW] = o_wbm_dat[i%DW] | (w_slave_sel[i/DW] & i_wbs_dat[i]);
	end

endmodule
`default_nettype wire
