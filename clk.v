`timescale 1ns / 1ps


//to produce 25MHz signals
module clk(clk, del_clk);
input wire clk;
output reg del_clk;

reg [1:0] cnt;

initial
begin
    cnt = 2'b00;
    del_clk = 1'b0;
end

always @(posedge clk)
begin
    cnt = cnt + 1;
    del_clk = cnt[1];
end

endmodule
