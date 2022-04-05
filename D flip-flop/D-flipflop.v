`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2022 13:52:47
// Design Name: 
// Module Name: D-flipflop
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


module D(input c, d,
         output reg q);
//reg q;      
initial begin
q=0;
end

always @ (posedge c) begin
q<=d;

end
endmodule

module tb;
reg clk = 1'b0;
reg din = 1'b0;
wire out;

D d1(.c(clk),
     .d(din),
     .q(out));
     
initial begin
din = 1'b0; #7;
din = 1'b1; #5;
din = 1'b0; #8;
din = 1'b1; #3;
din = 1'b0; #16;
din = 1'b1; #5;
din = 1'b0; #11;
din = 1'b1; #1;
din = 1'b0; #13;
din = 1'b1; #9;
end
always #5 clk=!clk;


endmodule
