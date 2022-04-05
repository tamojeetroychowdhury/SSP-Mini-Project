`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2022 12:11:40
// Design Name: 
// Module Name: Gates1
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


module a(input x, 
         input y,
         output aq,
         output oq,
         output xq);
       wire res1 = x & y;
       assign aq = res1;
       wire res2 = x | y;
       assign oq = res2;
       wire res3 = x ^ y;
       assign xq = res3;
 endmodule
 
 module tb;
 reg tx=1'b0;
 reg ty=1'b0;
 wire and_out;
 wire or_out;
 wire xor_out;
 
 a a1(.x(tx),
      .y(ty),
      .aq(and_out),
      .oq(or_out),
      .xq(xor_out));
 always #5 tx=!tx;
 always #10 ty=!ty;
 
 endmodule
      /*
 //initial begin
 //tx=1'b0; ty=1'b0;
 //#10;
 tx=1'b0; ty=1'b1;
 #10;
 tx=1'b1; ty=1'b0;
 #10;
 tx=1'b1; ty=1'b1;
 #10;*/
 
 
 
 
 //end
 //endmodule
//end
/*endmodule   

module tb;
reg tb_x;
reg tb_y;
//reg tb_rstn;
wire tb_q;

a d1(.x (tb_x),
       .y (tb_y),
       .q (tb_q));

initial begin
tb_x <= 4'b0011;
tb_y <= 4'b0101;
//tb_d <= 8'b10100011;

end
endmodule
module tb;
reg a=1'b0;
reg b=1'b0;
reg c=1'b0;

always #10 a=!a;
always #20 b=!b;
always #40 c=!c;

endmodule*/

