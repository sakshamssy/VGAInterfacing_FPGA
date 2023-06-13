`timescale 1ns / 1ps

module VGA_controller(clk, h_pixel, v_pixel, hsync, vsync);
input wire clk;
output wire [10:0] h_pixel;
output wire [9:0] v_pixel;
output wire hsync, vsync;

wire [1:0] display, sync, bporch, fporch;

h_counter hcnt (clk, hsync, display[0], fporch[0], sync[0], bporch[0], h_pixel);
v_counter vcnt (bporch[0], vsync, display[1], fporch[1], sync[1], bporch[1], v_pixel);

endmodule