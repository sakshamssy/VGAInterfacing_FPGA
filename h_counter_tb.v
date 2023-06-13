`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2022 16:11:55
// Design Name: 
// Module Name: h_counter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module h_counter_tb;

reg clk;

wire h_sync;
wire v_sync;

wire [3:0] R, G, B;

VGA vga(clk, h_sync, v_sync, R, G, B);

initial
begin
    clk = 1'b0;
    repeat(4915200)
    begin
    #1
        clk = ~clk;
    end
    $finish;
end

endmodule
