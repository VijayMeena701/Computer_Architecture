`include"Mux2way32bits.v"

module Mux4way32bits(a, b, c, d, sel, out);
    
input [31:0] a, b, c, d;
input [1:0] sel;
output [31:0] out;

wire [31:0] res0, res1;

Mux2way32bits MUX1(a, b, sel[0], res0);
Mux2way32bits MUX2(c, d, sel[0], res1);
Mux2way32bits MUX3(res0, res1, sel[1], out);

endmodule