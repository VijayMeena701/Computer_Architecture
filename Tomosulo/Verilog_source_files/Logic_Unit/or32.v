

module or32(OUT, IN1, IN2);

input [31:0] IN1, IN2;
output [31:0] OUT;

or or0(OUT[0], IN1[0], IN2[0]);
or or1(OUT[1], IN1[1], IN2[1]);
or or2(OUT[2], IN1[2], IN2[2]);
or or3(OUT[3], IN1[3], IN2[3]);
or or4(OUT[4], IN1[4], IN2[4]);
or or5(OUT[5], IN1[5], IN2[5]);
or or6(OUT[6], IN1[6], IN2[6]);
or or7(OUT[7], IN1[7], IN2[7]);
or or8(OUT[8], IN1[8], IN2[8]);
or or9(OUT[9], IN1[9], IN2[9]);
or or10(OUT[10], IN1[10], IN2[10]);
or or11(OUT[11], IN1[11], IN2[11]);
or or12(OUT[12], IN1[12], IN2[12]);
or or13(OUT[13], IN1[13], IN2[13]);
or or14(OUT[14], IN1[14], IN2[14]);
or or15(OUT[15], IN1[15], IN2[15]);
or or16(OUT[16], IN1[16], IN2[16]);
or or17(OUT[17], IN1[17], IN2[17]);
or or18(OUT[18], IN1[18], IN2[18]);
or or19(OUT[19], IN1[19], IN2[19]);
or or20(OUT[20], IN1[20], IN2[20]);
or or21(OUT[21], IN1[21], IN2[21]);
or or22(OUT[22], IN1[22], IN2[22]);
or or23(OUT[23], IN1[23], IN2[23]);
or or24(OUT[24], IN1[24], IN2[24]);
or or25(OUT[25], IN1[25], IN2[25]);
or or26(OUT[26], IN1[26], IN2[26]);
or or27(OUT[27], IN1[27], IN2[27]);
or or28(OUT[28], IN1[28], IN2[28]);
or or29(OUT[29], IN1[29], IN2[29]);
or or30(OUT[30], IN1[30], IN2[30]);
or or31(OUT[31], IN1[31], IN2[31]);

endmodule