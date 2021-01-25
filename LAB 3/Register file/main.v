`include"Mux32way32bits.v"

module main(srcadd1, srcadd2, destadd, ALUout, src1, src2);

input [4:0] srcadd1, srcadd2, destadd; //source address 1, source address 2, destination address
input [31:0] ALUout; //write data
output [31:0] src1, src2; //output data 1 corressponding to srcadd1, output data 2 corressponding to srcadd2 

//32 registers of 32 bit each
reg [31:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22, R23, R24, R25, R26, R27, R28, R29, R30, R31;

//temporary buffer for storing output of deMux (write operation)
wire [31:0] TR0, TR1, TR2, TR3, TR4, TR5, TR6, TR7, TR8, TR9, TR10, TR11, TR12, TR13, TR14, TR15, TR16, TR17, TR18, TR19, TR20, TR21, TR22, TR23, TR24, TR25, TR26, TR27, TR28, TR29, TR30, TR31;

//temporary select bits of deMux
wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26, s27, s28, s29, s30, s31;

//select = destination address
//selinv = ~select
wire [4:0] select, selinv;

assign select[0] = destadd[0];
assign select[1] = destadd[1];
assign select[2] = destadd[2];
assign select[3] = destadd[3];
assign select[4] = destadd[4];

not not0(selinv[0], select[0]);
not not1(selinv[1], select[1]);
not not2(selinv[2], select[2]);
not not3(selinv[3], select[3]);
not not4(selinv[4], select[4]);

and and0(s0, selinv[4], selinv[3], selinv[2], selinv[1], selinv[0]);
and and1(s1, selinv[4], selinv[3], selinv[2], selinv[1], select[0]);
and and2(s2, selinv[4], selinv[3], selinv[2], select[1], selinv[0]);
and and3(s3, selinv[4], selinv[3], selinv[2], select[1], select[0]);
and and4(s4, selinv[4], selinv[3], select[2], selinv[1], selinv[0]);
and and5(s5, selinv[4], selinv[3], select[2], selinv[1], select[0]);
and and6(s6, selinv[4], selinv[3], select[2], select[1], selinv[0]);
and and7(s7, selinv[4], selinv[3], select[2], select[1], select[0]);

and and8(s8, selinv[4], select[3], selinv[2], selinv[1], selinv[0]);
and and9(s9, selinv[4], select[3], selinv[2], selinv[1], select[0]);
and and10(s10, selinv[4], select[3], selinv[2], select[1], selinv[0]);
and and11(s11, selinv[4], select[3], selinv[2], select[1], select[0]);
and and12(s12, selinv[4], select[3], select[2], selinv[1], selinv[0]);
and and13(s13, selinv[4], select[3], select[2], selinv[1], select[0]);
and and14(s14, selinv[4], select[3], select[2], select[1], selinv[0]);
and and15(s15, selinv[4], select[3], select[2], select[1], select[0]);

and and16(s16, select[4], selinv[3], selinv[2], selinv[1], selinv[0]);
and and17(s17, select[4], selinv[3], selinv[2], selinv[1], select[0]);
and and18(s18, select[4], selinv[3], selinv[2], select[1], selinv[0]);
and and19(s19, select[4], selinv[3], selinv[2], select[1], select[0]);
and and20(s20, select[4], selinv[3], select[2], selinv[1], selinv[0]);
and and21(s21, select[4], selinv[3], select[2], selinv[1], select[0]);
and and22(s22, select[4], selinv[3], select[2], select[1], selinv[0]);
and and23(s23, select[4], selinv[3], select[2], select[1], select[0]);

and and24(s24, select[4], select[3], selinv[2], selinv[1], selinv[0]);
and and25(s25, select[4], select[3], selinv[2], selinv[1], select[0]);
and and26(s26, select[4], select[3], selinv[2], select[1], selinv[0]);
and and27(s27, select[4], select[3], selinv[2], select[1], select[0]);
and and28(s28, select[4], select[3], select[2], selinv[1], selinv[0]);
and and29(s29, select[4], select[3], select[2], selinv[1], select[0]);
and and30(s30, select[4], select[3], select[2], select[1], selinv[0]);
and and31(s31, select[4], select[3], select[2], select[1], select[0]);

Mux2way32bits M0(R0, ALUout, s0, TR0);
Mux2way32bits M1(R1, ALUout, s1, TR1);
Mux2way32bits M2(R2, ALUout, s2, TR2);
Mux2way32bits M3(R3, ALUout, s3, TR3);
Mux2way32bits M4(R4, ALUout, s4, TR4);
Mux2way32bits M5(R5, ALUout, s5, TR5);
Mux2way32bits M6(R6, ALUout, s6, TR6);
Mux2way32bits M7(R7, ALUout, s7, TR7);
Mux2way32bits M8(R8, ALUout, s8, TR8);
Mux2way32bits M9(R9, ALUout, s9, TR9);
Mux2way32bits M10(R10, ALUout, s10, TR10);
Mux2way32bits M11(R11, ALUout, s11, TR11);
Mux2way32bits M12(R12, ALUout, s12, TR12);
Mux2way32bits M13(R13, ALUout, s13, TR13);
Mux2way32bits M14(R14, ALUout, s14, TR14);
Mux2way32bits M15(R15, ALUout, s15, TR15);
Mux2way32bits M16(R16, ALUout, s16, TR16);
Mux2way32bits M17(R17, ALUout, s17, TR17);
Mux2way32bits M18(R18, ALUout, s18, TR18);
Mux2way32bits M19(R19, ALUout, s19, TR19);
Mux2way32bits M20(R20, ALUout, s20, TR20);
Mux2way32bits M21(R21, ALUout, s21, TR21);
Mux2way32bits M22(R22, ALUout, s22, TR22);
Mux2way32bits M23(R23, ALUout, s23, TR23);
Mux2way32bits M24(R24, ALUout, s24, TR24);
Mux2way32bits M25(R25, ALUout, s25, TR25);
Mux2way32bits M26(R26, ALUout, s26, TR26);
Mux2way32bits M27(R27, ALUout, s27, TR27);
Mux2way32bits M28(R28, ALUout, s28, TR28);
Mux2way32bits M29(R29, ALUout, s29, TR29);
Mux2way32bits M30(R30, ALUout, s30, TR30);
Mux2way32bits M31(R31, ALUout, s31, TR31);

//WRITE OPERATION
always@(ALUout)
begin
R0 = TR0;
R1 = TR1;
R2 = TR2;
R3 = TR3;
R4 = TR4;
R5 = TR5;
R6 = TR6;
R7 = TR7;
R8 = TR8;
R9 = TR9;
R10 = TR10;
R11 = TR11;
R12 = TR12;
R13 = TR13;
R14 = TR14;
R15 = TR15;
R16 = TR16;
R17 = TR17;
R18 = TR18;
R19 = TR19;
R20 = TR20;
R21 = TR21;
R22 = TR22;
R23 = TR23;
R24 = TR24;
R25 = TR25;
R26 = TR26;
R27 = TR27;
R28 = TR28;
R29 = TR29;
R30 = TR30;
R31 = TR31;
end

//READ OPERATION
//src1 = data at srcadd1
Mux32way32bits MUX1(R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, 
R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, 
R20, R21, R22, R23, R24, R25, R26, R27, R28, R29, 
R30, R31, srcadd1, src1);

//src2 = data at srcadd2
Mux32way32bits MUX2(R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, 
R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, 
R20, R21, R22, R23, R24, R25, R26, R27, R28, R29, 
R30, R31, srcadd2, src2);

endmodule