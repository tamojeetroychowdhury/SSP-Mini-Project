`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2022 20:52:17
// Design Name: 
// Module Name: Image
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


module Image(clk, img, pix, ox, oy);
input clk;
input [0:63] img;
output reg pix;
output reg[2:0] ox;
output reg[2:0] oy;
reg[5:0] count;

integer i=0;

initial begin
//ox = 0; oy=0;
pix = 1'b0; 
count=1'b0;
end

always @ (posedge clk)
begin

if (i==64) $stop;

if (img[i]==1) 
begin
pix = 1'b1;
ox = count[2:0];
oy = count[5:3];
end

if (img[i]==0)
begin
pix = 1'b0;
end

count = count + 1;
i = i + 1;

end

endmodule


module tb;
reg clock = 1'b0;

/*Array img_arr is as follows - 
00010110
10010000
00100010
10010000
00000100
10101110
00001001
00101100
*/ 

reg [0:63] img_arr = 64'b0001011010010000001000101001000000000100101011100000100100101100;

wire [2:0] x;
wire [2:0] y;
wire pixel;

Image i1(.clk (clock), .img (img_arr), .pix (pixel), .ox (x), .oy(y));

always #5 clock = !clock;

endmodule