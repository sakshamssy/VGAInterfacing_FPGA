/*
* v_sync info::
	* pixel clk = 108MHz
	* display = 864 ticks
	* front porch = 1 ticks
	* sync pulse = 3 ticks
	* back porch = 32 ticks
	* TOTAL == 900 ticks
*/
/*
* v_sync info::
	* pixel clk = 25MHz
	* display = 480 ticks
	* front porch = 10 ticks
	* sync pulse = 2 ticks
	* back porch = 33 ticks
	* TOTAL == 525 ticks
*/
module v_counter (clk, vsync, display, front_porch, sync_pulse, back_porch, v_pixel);
	input wire clk;
	output reg display, front_porch, sync_pulse, back_porch, vsync;
	output reg [9:0] v_pixel;

	initial
	begin
		v_pixel = 9'b0;
		display = 1'b1;
		front_porch = 1'b0;
		sync_pulse = 1'b1;
		back_porch = 1'b0;
	end
	always @(negedge clk)
	begin
	    vsync = display + front_porch + back_porch;
		if (v_pixel == 524)
		begin
			display = 1'b1;
			front_porch = 1'b0;
			sync_pulse = 1'b1;
			back_porch = 1'b0;

			v_pixel = 9'b0;
		end
		else if (v_pixel > 491)
		begin
			display = 1'b0;
			front_porch = 1'b0;
			sync_pulse = 1'b1;
			back_porch = 1'b1;

			v_pixel = v_pixel + 1;
		end
		else if (v_pixel > 489)
		begin
			display = 1'b0;
			front_porch = 1'b0;
			sync_pulse = 1'b0;
			back_porch = 1'b0;

			v_pixel = v_pixel + 1;
		end
		else if (v_pixel > 479)
		begin
			display = 1'b0;
			front_porch = 1'b1;
			sync_pulse = 1'b1;
			back_porch = 1'b0;

			v_pixel = v_pixel + 1;
		end
		else
		begin
			v_pixel = v_pixel + 1;
		end
	end
endmodule
