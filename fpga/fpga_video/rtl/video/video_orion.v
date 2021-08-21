module video_orion
(
	input		wire			i_clk,
	input		wire			i_clk2,
	input		wire[11:0]	i_x_full_size,
	input		wire[11:0]	i_y_full_size,
	input		wire[11:0]	i_x,
	input		wire[11:0]	i_y,
	input		wire			i_line_end,
	input		wire			i_wide_screen,
	input		wire[2:0]	i_video_mode,
	input		wire[31:0]	i_vdata,
	output	wire[7:0]	o_line_idx,
	output	wire[5:0]	o_column,
	output	wire[7:0]	o_r,
	output	wire[7:0]	o_g,
	output	wire[7:0]	o_b
);

	localparam[11:0]	SCREEN_RES_X_NORM = 12'd384;
	localparam[11:0]	SCREEN_RES_X_WIDE = 12'd512;
	localparam[11:0]	SCREEN_RES_Y		= 12'd256;

	wire[11:0]	w_x_size = (i_wide_screen ? SCREEN_RES_X_WIDE : SCREEN_RES_X_NORM);
	wire[11:0]	w_y_size = SCREEN_RES_Y;

	wire		w_x_is_double = ({ w_x_size, 1'b0 } <= { 1'b0, i_x_full_size }) ? 1'b1 : 1'b0;
	wire		w_y_is_double = ({ w_y_size, 1'b0 } <= { 1'b0, i_y_full_size }) ? 1'b1 : 1'b0;

	wire[11:0]	w_x = w_x_is_double ? { 1'b0, i_x[11:1] } : i_x;
	wire[11:0]	w_y = w_y_is_double ? { 1'b0, i_y[11:1] } : i_y;
	wire[11:0]	w_x_active = w_x_is_double ? { 1'b0, i_x_full_size[11:1] } : i_x_full_size;
	wire[11:0]	w_y_active = w_y_is_double ? { 1'b0, i_y_full_size[11:1] } : i_y_full_size;

	wire[11:0]	w_x_border2 = w_x_active - w_x_size;
	wire[11:0]	w_x_border = { 1'b0, w_x_border2[11:1] };
	wire[11:0]	w_y_border2 = w_y_active - w_y_size;
	wire[11:0]	w_y_border = { 1'b0, w_y_border2[11:1] };

	wire[11:0]	w_x_actual = w_x - w_x_border;
	wire[11:0]	w_y_actual = w_y - w_y_border;

	reg[11:0]	r_y;
	reg[11:0]	r_x;
	reg[11:0]	r_x_pre;
	//reg			r_x_is_active, r_y_is_active;
	
	wire			w_x_is_active = (r_x >= 0) & (r_x < w_x_size);
	wire			w_y_is_active = (r_y >= 0) & (r_y < w_y_size);
	wire			w_is_active = w_x_is_active & w_y_is_active;

	always @(posedge i_clk)
	begin
		r_x <= w_x_actual;
		r_x_pre <= w_x_actual + 3'd7;
		//r_x_is_active <= w_x_is_active;
		//r_y_is_active <= w_y_is_active;
		if (i_line_end == 1'b1)
		begin
			r_y <= w_y_actual;
		end
	end




	assign o_line_idx = r_y[7:0];
	assign o_column = r_x_pre[8:3];

///////
	wire w_clk = w_x_is_double ? (~i_clk2) : i_clk;
	reg[7:0]	r_col0;
	//reg		r_out;
	always @(posedge w_clk)
	begin
		if (r_x[2:0] == 3'b111)
		begin
			r_col0 <= i_vdata[7:0];
		end
			else
		begin
			r_col0 <= { 1'b0, r_col0[7:1] };
		end
		//r_out <= r_col0[0];
	end

	reg[7:0]	r_red;
	reg[7:0]	r_green;
	reg[7:0]	r_blue;

	always @(posedge w_clk)
	begin
		r_red <= /*w_is_active ? r_x[7:0] :*/ 8'h00;
		r_green <= w_is_active ? /*r_y[7:0]*/ {8{r_col0[0]}} : 8'h00;
		r_blue <= /*w_is_active ? { r_y[11:8], r_x[11:8] } :*/ 8'h00;
	end

	assign o_r = r_red;
	assign o_g = r_green;
	assign o_b = r_blue;

endmodule
