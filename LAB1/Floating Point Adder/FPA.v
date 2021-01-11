`include "Shift.v"
`include "rdcla.v"
`include "Split.v"
`include "swap.v"

module FPA(input[31:0] Val1, input[31:0] Val2, output reg[31:0] out);

    wire [31:0]a,b;
    Swap SW(Val1,Val2,a,b); //if Val1 < Val2 swap the values

    wire sign1,sign2;
    wire [7:0] exp1,exp2;
    wire [22:0] mant1,mant2;

    Split SP1(a,sign1,exp1,mant1); // Spliting Value1 into Sign, Exponent, Mantissa
    Split SP2(b,sign2,exp2,mant2); // Spliting Value2 into Sign, Exponent, Mantissa

    wire [31:0] N1;
    assign N1 = {|exp1,mant1};   //Reduction or handles zeroes
    wire [31:0] N2;
    assign N2 = {|exp2,mant2};   //and denormal numbers

    wire  [7:0]delta;
    assign delta = exp1 - exp2; // Get the difference between the Exponents as we already know a is greater than b (if any) hence exp1 is greater than exp 2

    wire [31:0] N3;
    Shift BS(N2,delta,N3);  // Align the mantissa by delta if exponents are different

    wire [31:0]N4;
    assign N4 = {32{sign1^sign2}}^N3;

    wire [31:0]Sum;
    wire Carry;
    rdcla C1(N1,N4,sign1^sign2,Sum,Carry);

    reg [22:0] M3,tmp;
    reg [7:0] E3;

    integer i = 0;

    always @(Sum)
    begin
        if(Sum[24]==1)
        begin
            M3 = Sum[23:1];
            E3 = exp1 + 1'b1;
        end
        else if(Sum[23]==0)
        begin
            i = 1;
            while(Sum[23-i] == 1'b0)
            begin
                i = i+1;
            end 
            E3 = E3 - i;
            tmp = Sum[22:0];
            M3 = tmp<<i;
        end
        else
        begin
            M3 = Sum[22:0];
            E3 = exp1;
        end
    end

    always @ (E3 or M3)
    begin

        // Case for handling infinity addition
        if(&exp1 == 1'b1 && |mant1 == 1'b0)
            out = {sign1,{8{1'b1}},23'b0};
        else 
            out = {sign1,{8{|Sum}} & E3,M3};
    end

endmodule