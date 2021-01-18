`include "RequiredFiles/WTM.v"
`include "RequiredFiles/RDCLA.v"
`include "RequiredFiles/Split.v"
`include "RequiredFiles/Calc_Sign.v"
`include "RequiredFiles/Man_mod.v"

module SPFP_Multiplier(input[31:0] Val1, input[31:0] Val2, output reg[31:0] res);

wire [31:0] val1, val2;
assign val1 = Val1;
assign val2 = Val2;

wire [0:0] sign1, sign2;
wire [7:0] exp1, exp2;
wire [22:0] man1, man2;

Split x1(val1, sign1, exp1, man1);
Split x2(val2, sign2, exp2, man2);

reg [0:0] Sign_out;
reg [7:0] Exp_out;
reg [22:0] Man_out, temporary;

wire sign;
	Calc_Sign s1(sign1, sign2, sign);

wire [23:0] temp_man1, temp_man2;
wire [47:0] mul_man_M3;
wire [7:0] temp_E1, temp_E2;
wire cout;

	Man_mod m1(exp1, man1, temp_man1);
	Man_mod m2(exp2, man2, temp_man2);	
	WTM w0(temp_man1, temp_man2, mul_man_M3);           // M3 = M1*M2


	RDCLA r0(exp1, exp2, temp_E1, cout);                // temp E1 = E1 + E2
	RDCLA r1(temp_E1, 8'b10000011, temp_E2, cout);      // temp E2 =  E1 + E2 - bias

integer i = 0;

always @(mul_man_M3) 
    begin
        if(mul_man_M3[47] == 1) 
            begin
                Man_out = mul_man_M3[46:24];
                Exp_out = temp_E2 + 1'b1;                   // E3 = temp E2 + 1
                Sign_out = sign;
            end
        else
            begin
                Man_out = mul_man_M3[45:23];
                Exp_out = temp_E2;
                Sign_out = sign;
            end
    end

always @ (*)
    begin
        if((&exp1 == 1'b1 || &exp2 == 1'b1) && (|exp1 == 1'b0 || |exp2 == 1'b0))    // infinity x zero
            res = {sign,{8{1'b1}},23'b11111111111111111111111};
        else if(&exp1 == 1'b1 || &exp2 == 1'b1)                                     // infinity x something
                res = {sign,{8{1'b1}},23'b0};
        else if(|exp1 == 1'b0 || |exp2 == 1'b0)                                     // zero x something
            res = {sign,{8{1'b0}},23'b0};
        else
            res = {Sign_out, Exp_out, Man_out};                                     // something x something
    end

endmodule