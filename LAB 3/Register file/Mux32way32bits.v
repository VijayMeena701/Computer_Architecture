`include"Mux4way32bits.v"

module Mux32way32bits(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, 
a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, 
a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, 
a30, a31, sel, out);

input [31:0] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, a30, a31;
input [4:0] sel;
output [31:0] out;

wire [31:0] res1, res2, res3, res4, res5, res6, res7, res8, res9, res10;

Mux4way32bits MUX1(a0, a1, a2, a3, sel[1:0], res1);
Mux4way32bits MUX2(a4, a5, a6, a7, sel[1:0], res2);
Mux4way32bits MUX3(a8, a9, a10, a11, sel[1:0], res3);
Mux4way32bits MUX4(a12, a13, a14, a15, sel[1:0], res4);
Mux4way32bits MUX5(a16, a17, a18, a19, sel[1:0], res5);
Mux4way32bits MUX6(a20, a21, a22, a23, sel[1:0], res6);
Mux4way32bits MUX7(a24, a25, a26, a27, sel[1:0], res7);
Mux4way32bits MUX8(a28, a29, a30, a31, sel[1:0], res8);

Mux4way32bits MUX9(res1, res2, res3, res4, sel[3:2], res9);
Mux4way32bits MUX10(res5, res6, res7, res8, sel[3:2], res10);

Mux2way32bits MUX11(res9, res10, sel[4], out);

endmodule