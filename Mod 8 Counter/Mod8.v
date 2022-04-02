`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2022 23:18:54
// Design Name: 
// Module Name: Mod8
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


module C(input clk, rstn,
         output reg[2:0] o);

initial begin
o = 0;
end


always @ (posedge clk) 
if (!rstn) o <= 0;
else begin
o = (o+1)%8; 
end
endmodule

module tb;
reg clock=1'b0;
reg reset=1'b0;
wire[2:0] out;

C c1(.clk(clock),
     .rstn(reset),
     .o(out));
     
initial begin
reset=1'b0;
#20;
reset=1'b1;
end
 
always #10 clock=!clock;
 
endmodule