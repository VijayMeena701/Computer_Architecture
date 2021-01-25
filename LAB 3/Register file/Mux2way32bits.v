

module Mux2way32bits(a, b, sel, out);

input [31:0] a, b;
input sel;
output [31:0] out;

wire selinv;
wire [31:0] res1, res2;

not not1(selinv, sel);

genvar i;
generate
    for(i = 31; i >= 0; i = i - 1)
    begin
        and and1(res1[i], a[i], selinv);
        and and2(res2[i], b[i], sel);
    end
endgenerate

genvar j;
generate
    for(j = 31; j >= 0; j = j - 1)
    begin
        or or1(out[j], res1[j], res2[j]);
    end
endgenerate

endmodule
