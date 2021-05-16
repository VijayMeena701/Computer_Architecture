

module nor32(OUT, IN1, IN2);

input [31:0] IN1, IN2;
output [31:0] OUT;

nor nor0(OUT[0], IN1[0], IN2[0]);
nor nor1(OUT[1], IN1[1], IN2[1]);
nor nor2(OUT[2], IN1[2], IN2[2]);
nor nor3(OUT[3], IN1[3], IN2[3]);
nor nor4(OUT[4], IN1[4], IN2[4]);
nor nor5(OUT[5], IN1[5], IN2[5]);
nor nor6(OUT[6], IN1[6], IN2[6]);
nor nor7(OUT[7], IN1[7], IN2[7]);
nor nor8(OUT[8], IN1[8], IN2[8]);
nor nor9(OUT[9], IN1[9], IN2[9]);
nor nor10(OUT[10], IN1[10], IN2[10]);
nor nor11(OUT[11], IN1[11], IN2[11]);
nor nor12(OUT[12], IN1[12], IN2[12]);
nor nor13(OUT[13], IN1[13], IN2[13]);
nor nor14(OUT[14], IN1[14], IN2[14]);
nor nor15(OUT[15], IN1[15], IN2[15]);
nor nor16(OUT[16], IN1[16], IN2[16]);
nor nor17(OUT[17], IN1[17], IN2[17]);
nor nor18(OUT[18], IN1[18], IN2[18]);
nor nor19(OUT[19], IN1[19], IN2[19]);
nor nor20(OUT[20], IN1[20], IN2[20]);
nor nor21(OUT[21], IN1[21], IN2[21]);
nor nor22(OUT[22], IN1[22], IN2[22]);
nor nor23(OUT[23], IN1[23], IN2[23]);
nor nor24(OUT[24], IN1[24], IN2[24]);
nor nor25(OUT[25], IN1[25], IN2[25]);
nor nor26(OUT[26], IN1[26], IN2[26]);
nor nor27(OUT[27], IN1[27], IN2[27]);
nor nor28(OUT[28], IN1[28], IN2[28]);
nor nor29(OUT[29], IN1[29], IN2[29]);
nor nor30(OUT[30], IN1[30], IN2[30]);
nor nor31(OUT[31], IN1[31], IN2[31]);

endmodule