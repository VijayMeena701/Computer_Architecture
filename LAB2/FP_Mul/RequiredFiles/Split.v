module Split(input [31:0]inp, output sign, output [7:0]exp, output [22:0]man);
    assign sign = inp[31];
    assign exp = inp [30:23];
    assign man = inp[22:0];
endmodule