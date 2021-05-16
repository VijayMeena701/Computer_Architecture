`include"not32.v"
`include"cla.v"

module twoscomp32(OUT, IN);

input [31:0] IN;
output [31:0] OUT;

wire [31:0] not_in;
wire [31:0] sum;
wire carryout;

not32 NOT32_1(not_in, IN);

CLA CLA0(not_in, 32'b1, 1'b0, OUT, carryout);

endmodule