

module xor32(OUT, IN1, IN2);

input [31:0] IN1, IN2;
output [31:0] OUT;

xor xor0(OUT[0], IN1[0], IN2[0]);
xor xor1(OUT[1], IN1[1], IN2[1]);
xor xor2(OUT[2], IN1[2], IN2[2]);
xor xor3(OUT[3], IN1[3], IN2[3]);
xor xor4(OUT[4], IN1[4], IN2[4]);
xor xor5(OUT[5], IN1[5], IN2[5]);
xor xor6(OUT[6], IN1[6], IN2[6]);
xor xor7(OUT[7], IN1[7], IN2[7]);
xor xor8(OUT[8], IN1[8], IN2[8]);
xor xor9(OUT[9], IN1[9], IN2[9]);
xor xor10(OUT[10], IN1[10], IN2[10]);
xor xor11(OUT[11], IN1[11], IN2[11]);
xor xor12(OUT[12], IN1[12], IN2[12]);
xor xor13(OUT[13], IN1[13], IN2[13]);
xor xor14(OUT[14], IN1[14], IN2[14]);
xor xor15(OUT[15], IN1[15], IN2[15]);
xor xor16(OUT[16], IN1[16], IN2[16]);
xor xor17(OUT[17], IN1[17], IN2[17]);
xor xor18(OUT[18], IN1[18], IN2[18]);
xor xor19(OUT[19], IN1[19], IN2[19]);
xor xor20(OUT[20], IN1[20], IN2[20]);
xor xor21(OUT[21], IN1[21], IN2[21]);
xor xor22(OUT[22], IN1[22], IN2[22]);
xor xor23(OUT[23], IN1[23], IN2[23]);
xor xor24(OUT[24], IN1[24], IN2[24]);
xor xor25(OUT[25], IN1[25], IN2[25]);
xor xor26(OUT[26], IN1[26], IN2[26]);
xor xor27(OUT[27], IN1[27], IN2[27]);
xor xor28(OUT[28], IN1[28], IN2[28]);
xor xor29(OUT[29], IN1[29], IN2[29]);
xor xor30(OUT[30], IN1[30], IN2[30]);
xor xor31(OUT[31], IN1[31], IN2[31]);

endmodule