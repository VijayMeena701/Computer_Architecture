`include "Cla/adder64alt.v"
`include "FullAdder/3fam.v"
`include "Partial/ppg.v"
`include "dff_lvl.v"

module wallace(c,a,b,clk,rst);
input [32:0] a,b;
output reg d;
output[64:0] c;

input [7:0]xin;
input clk,rst;
assign xin="k";
output [7:0]xout;


wire [31:0][64:0] pp;

wire [31:0][64:0] pp_c;


ppg ppg_0(pp_c,a[31:0],b[31:0]);
dff_lvl_1 m1(pp_c,rst,clk,pp); //1st pipeline


// -------------------------------------LEVEL-1-----------------------------------//

wire  [9:0][64:0] sum_c,ca_c,sum,ca;

three_fa a_0(sum_c[2:0],ca_c[2:0],pp[8:0]);
three_fa a_1(sum_c[5:3],ca_c[5:3],pp[17:9]);
three_fa a_2(sum_c[8:6],ca_c[8:6],pp[26:18]);

sixtyBitAdder a_3(pp[27],pp[28],pp[29],sum_c[9],ca_c[9]);

dff_lvl_2 m2(sum_c,ca_c,rst,clk,sum,ca); //2nd pipeline

// -------------------------------------LEVEL-2-----------------------------------//

wire [6:0][64:0] sum2_c,ca2_c,sum2,ca2;



three_fam a_4(sum2_c[2:0],ca2_c[2:0],sum[4:0],ca[3:0]);
three_fam a_5(sum2_c[5:3],ca2_c[5:3],ca[8:4],sum[8:5]);

sixtyBitAdder a_6(sum[9],ca[9],pp[30],sum2_c[6],ca2_c[6]);

dff_lvl_3 m3(sum2_c,ca2_c,rst,clk,sum2,ca2); //3rd pipeline


// -------------------------------------LEVEL-3-----------------------------------//

wire [4:0][64:0] sum3_c,ca3_c,sum3,ca3;

three_fam a_7(sum3_c[2:0],ca3_c[2:0],sum2[4:0],ca2[3:0]);

sixtyBitAdder a_8(sum2[5],ca2[4],ca2[5],sum3_c[3],ca3_c[3]);
sixtyBitAdder a_9(sum2[6],ca2[6],pp[31],sum3_c[4],ca3_c[4]);

dff_lvl_4 m4(sum3_c,ca3_c,rst,clk,sum3,ca3); //4th pipeline

// -------------------------------------LEVEL-4-----------------------------------//


wire [2:0][64:0] sum4_c,ca4_c,sum4,ca4;

three_fam a_10(sum4_c[2:0],ca4_c[2:0],sum3[4:0],ca3[3:0]);

dff_lvl_5 m5(sum4_c,ca4_c,rst,clk,sum4,ca4); //5th pipeline

// -------------------------------------LEVEL-5-----------------------------------//

wire [1:0][64:0] sum5_c,ca5_c,sum5,ca5;

sixtyBitAdder a_11(sum4[0],sum4[1],ca4[0],sum5[0],ca5[0]);
sixtyBitAdder a_12(sum4[2],ca4[1],ca4[2],sum5[1],ca5[1]);

dff_lvl_6 m6(sum5_c,ca5_c,rst,clk,sum5,ca5); //6th pipeline

// -------------------------------------LEVEL-6-----------------------------------//

wire [64:0] sum6_c,ca6_c,sum6,ca6;

sixtyBitAdder a_13(sum5[0],sum5[1],ca5[0],sum6_c,ca6_c);

dff_lvl_7 m7(sum6_c,ca6_c,rst,clk,sum6,ca6); //7th pipeline

// -------------------------------------LEVEL-7-----------------------------------//

wire [64:0] sum7_c,ca7_c,sum7,ca7;

sixtyBitAdder a_14(sum6,ca5[1],ca6,sum7_c,ca7_c);

dff_lvl_7 m8(sum7_c,ca7_c,rst,clk,sum7,ca7); //8th pipeline
// -------------------------------------LEVEL-8-----------------------------------//

wire [64:0] sum8_c,ca8_c,sum8,ca8;

sixtyBitAdder a_15(sum7,ca3[4],ca7,sum8_c,ca8_c);
 
dff_lvl_7 m9(sum8_c,ca8_c,rst,clk,sum8,ca8);//9th pipeline
// -------------------------------------LEVEL-9-----------------------------------//

adder a_16(c[63:0],xout,sum8[63:0],ca8[63:0],xin,clk,rst);


assign c[64]=0;
endmodule

