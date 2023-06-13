/*
* h_sync info::
	* pixel clk = 108MHz
	* display = 1152 ticks
	* front porch = 64 ticks
	* sync pulse = 128 ticks
	* back porch = 256 ticks
	* TOTAL == 1600 ticks
*/
/*
* h_sync info 25MHz::
	* pixel clk = 25MHz
	* display = 640 ticks
	* front porch = 16 ticks
	* sync pulse = 96 ticks
	* back porch = 48 ticks
	* TOTAL == 800 ticks
*/
module h_counter (clk, hsync, display, front_porch, sync_pulse, back_porch, h_pixel);
	input wire clk;
	output reg display, front_porch, sync_pulse, back_porch, hsync;
	output reg [10:0] h_pixel;

	initial
	begin
		h_pixel = 11'b0;
		display = 1'b1;
		front_porch = 1'b0;
		sync_pulse = 1'b1;
		back_porch = 1'b0;
		hsync = 1'b0;
	end
	always @(posedge clk)
	begin
	    hsync = display + front_porch + back_porch;
		if (h_pixel == 799)
		begin
			display = 1'b1;
			front_porch = 1'b0;
			sync_pulse = 1'b1;
			back_porch = 1'b0;

			h_pixel = 11'b0;
		end
		else if (h_pixel > 751)
		begin
			display = 1'b0;
			front_porch = 1'b0;
			sync_pulse = 1'b1;
			back_porch = 1'b1;

			h_pixel = h_pixel + 1;
		end
		else if (h_pixel > 655)
		begin
			display = 1'b0;
			front_porch = 1'b0;
			sync_pulse = 1'b0;
			back_porch = 1'b0;

			h_pixel = h_pixel + 1;
		end
		else if (h_pixel > 639)
		begin
			display = 1'b0;
			front_porch = 1'b1;
			sync_pulse = 1'b1;
			back_porch = 1'b0;

			h_pixel = h_pixel + 1;
		end
		else
		begin
			h_pixel = h_pixel + 1;
		end
	end
endmodule
