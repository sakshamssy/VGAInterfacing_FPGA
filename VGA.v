`timescale 1ns / 1ps


module VGA(clk, hsync, vsync, R, G, B);

input wire clk;

output wire hsync, vsync;
output reg [3:0] R, G, B;

wire delay_clk;
wire [10:0] h_pixel;
wire [9:0] v_pixel;

always @(posedge delay_clk)
//    if (h_pixel < 640 && v_pixel < 480)
//    begin
//        R = 4'b1111;
//        B = 4'b0000;
//        G = 4'b1111;
//    end
    if (h_pixel < 213 && v_pixel < 480)
    begin
    // golden yellow
        R = 4'b1111;
        B = 4'b0001;
        G = 4'b0111;
    end
    else if (h_pixel < 426 && v_pixel < 480)
    begin
    // sky blue
        R = 4'b0011;
        B = 4'b1111;
        G = 4'b1011;
    end
    else if (h_pixel < 640 && v_pixel < 480)
    begin
    // tomato
        R = 4'b1111;
        B = 4'b0001;
        G = 4'b0001;
    end
    else
    begin
        R = 4'b0000;
        B = 4'b0000;
        G = 4'b0000;   
    end
clk c (clk, delay_clk);
VGA_controller vga (delay_clk, h_pixel, v_pixel, hsync, vsync);

endmodule