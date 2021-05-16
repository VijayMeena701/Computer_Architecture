

module xnor32(OUT, IN1, IN2);

input [31:0] IN1, IN2;
output [31:0] OUT;

xnor xnor0(OUT[0], IN1[0], IN2[0]);
xnor xnor1(OUT[1], IN1[1], IN2[1]);
xnor xnor2(OUT[2], IN1[2], IN2[2]);
xnor xnor3(OUT[3], IN1[3], IN2[3]);
xnor xnor4(OUT[4], IN1[4], IN2[4]);
xnor xnor5(OUT[5], IN1[5], IN2[5]);
xnor xnor6(OUT[6], IN1[6], IN2[6]);
xnor xnor7(OUT[7], IN1[7], IN2[7]);
xnor xnor8(OUT[8], IN1[8], IN2[8]);
xnor xnor9(OUT[9], IN1[9], IN2[9]);
xnor xnor10(OUT[10], IN1[10], IN2[10]);
xnor xnor11(OUT[11], IN1[11], IN2[11]);
xnor xnor12(OUT[12], IN1[12], IN2[12]);
xnor xnor13(OUT[13], IN1[13], IN2[13]);
xnor xnor14(OUT[14], IN1[14], IN2[14]);
xnor xnor15(OUT[15], IN1[15], IN2[15]);
xnor xnor16(OUT[16], IN1[16], IN2[16]);
xnor xnor17(OUT[17], IN1[17], IN2[17]);
xnor xnor18(OUT[18], IN1[18], IN2[18]);
xnor xnor19(OUT[19], IN1[19], IN2[19]);
xnor xnor20(OUT[20], IN1[20], IN2[20]);
xnor xnor21(OUT[21], IN1[21], IN2[21]);
xnor xnor22(OUT[22], IN1[22], IN2[22]);
xnor xnor23(OUT[23], IN1[23], IN2[23]);
xnor xnor24(OUT[24], IN1[24], IN2[24]);
xnor xnor25(OUT[25], IN1[25], IN2[25]);
xnor xnor26(OUT[26], IN1[26], IN2[26]);
xnor xnor27(OUT[27], IN1[27], IN2[27]);
xnor xnor28(OUT[28], IN1[28], IN2[28]);
xnor xnor29(OUT[29], IN1[29], IN2[29]);
xnor xnor30(OUT[30], IN1[30], IN2[30]);
xnor xnor31(OUT[31], IN1[31], IN2[31]);

endmodule