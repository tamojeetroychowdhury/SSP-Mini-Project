`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2022 21:12:43
// Design Name: 
// Module Name: Adders
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

//ADDERS//////////////////////////////////////////////////////////////////////////

/*module Adders(input a, b, pc,
              output s, c);
       wire r1 = a ^ b;
       wire r2 = r1 ^ pc;
       wire r3 = (a & b) | (pc & r1);
       assign s = r2;
       assign c = r3;
endmodule

module tb;
reg ia=1'b0;
reg ib=1'b0;
reg ic=1'b0;
wire sum;
wire carry;

Adders a(.a(ia),
        .b(ib),
        .pc(ic),
        .s(sum),
        .c(carry));
always #5 ia=!ia;
always #10 ib=!ib;
always #20 ic=!ic;
        
endmodule*/


//D FLIP-FLOP/////////////////////////////////////////////////////////////////////////


/*module D(input c, d,
         output q);
reg q;      

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
din = 1'b0; #10;
din = 1'b0; #10;
din = 1'b1; #10;
din = 1'b0; #10;
din = 1'b1; #10;
din = 1'b1; #10;
din = 1'b1; #10;
din = 1'b0; #10;
din = 1'b0; #10;
din = 1'b1; #10;
end
always #10 clk=!clk;
endmodule*/

//MOD-8 COUNTER/////////////////////////////////////////////////////////////////////////////////
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
      
      
      
///MULTI-BIT ADDER///////////////////////////////////////////////////////////////////////

/*module adder(a,b,y);
input [7:0] a;
input [7:0] b;
output reg[8:0] y;
reg[8:0] c;
integer i;
always @ (a or b or c)
begin
c[0]=0;
            
for (i=0; i<8; i=i+1)
begin
y[i] = a[i] ^ b[i] ^ c[i];
c[i+1] = (a[i]&b[i]) | (b[i]&c[i]) | (c[i]&a[i]);
end

y[8]=c[8];
end
endmodule


module tb;
reg[7:0] ia;
reg[7:0] ib;
wire[8:0] sum;

adder q(.a(ia),
      .b(ib),
      .y(sum));

initial begin
ia = 8'b00000001; ib = 8'b00000001; #10
ia = 8'b00000001; ib = 8'b00000010; #10
ia = 8'b10000011; ib = 8'b11100010; //#10
//$stop;

end
endmodule
*/

///ARITHMETIC LOGIC UNIT//////////////////////////////////////////////////////////////////////////////////////

/*module alu(s1, s2, p, q, y);
input s1, s2; //00 is add, 01 is subtract, 10 is bitwise AND, 11 is bitwise XOR
input [7:0] p;
input [7:0] q;
output reg[8:0] y;

reg c[8:0], b[8:0];

integer i;

always @ (p or q or y)
begin

if (!s1 & !s2)
begin
c[0]=0;
for (i=0; i<8; i=i+1)
begin
y[i] = p[i] ^ q[i] ^ c[i];
c[i+1] = (p[i]&q[i]) | (q[i]&c[i]) | (c[i]&p[i]);
end
y[8]=c[8];
end


if (!s1 & s2)
begin
b[0]=0;
for (i=0; i<8; i=i+1)
begin
y[i] = p[i] ^ q[i] ^ b[i];
//b[i+1] = !b[i] & (p[i]^q[i]) | (p[i]&q[i]);
b[i+1] = (!p[i] & q[i]) | (!(p[i] ^ q[i]) & b[i]);
end
y[8]=b[8];
end


if (s1 & !s2)
for (i=0; i<8; i=i+1)
begin
y[i] = p[i] & q[i];
end

if (s1 & s2)
for (i=0; i<8; i=i+1)
begin
y[i] = p[i] ^ q[i];
end




end
endmodule


module tb;
reg [7:0] ip;
reg [7:0] iq;
wire [8:0] out;
reg select1 = 1'b0;
reg select2 = 1'b0;

alu m(.p(ip), .q(iq), .s1(select1), .s2(select2), .y(out));

integer i;
initial begin
for (i=0; i<4; i=i+1)
begin
ip = 8'b00000001; iq = 8'b00000001; #10
ip = 8'b00000010; iq = 8'b00000011; #10
ip = 8'b01100010; iq = 8'b00001111; #10
ip = 8'b01110001; iq = 8'b00101010; #10
ip = 8'b11100011; iq = 8'b10000010; #10;
end

$finish;
end

always #50 select2 = !select2;
always #100 select1 = !select1;




endmodule*/
