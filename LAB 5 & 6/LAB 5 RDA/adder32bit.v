`include "kpg.v"
`include "ppc_storage.v"
`include "dff.v"

module adder(sum_out,carry_out,a,b,carry_in,clock,reset);
    input [31:0] a,b;
    input clock,reset;
    input[7:0] carry_in;
    output [32:0][7:0]x;
    integer i=0;
    output reg[7:0] ym;

    output [7:0]carry_out;
    output [31:0][7:0] y ;
    output reg[31:0] sum_out;
    input [31:0] c,d,e,f;

    dff m1(a,b,reset,clock,c,d); //pipeline-1

    kpgg kpg_0(x[8:1],c[7:0],d[7:0]);
    kpgg kpg_1(x[16:9],c[15:8],d[15:8]);
    kpgg kpg_2(x[24:17],c[23:16],d[23:16]);
    kpgg kpg_3(x[32:25],c[31:24],d[31:24]);

    assign x[0]=carry_in;

    ppc ppc_0(y[31:0],x[31:0],reset,clock,c,d,e,f);

    always@(posedge clock)
        begin
            for(i=0;i<32;i=i+1)
                begin
                    if(y[i]=="k")
                        sum_out[i]=(e[i]^f[i])^0;
                    else
                        sum_out[i]=(e[i]^f[i])^1;
                end
        end

endmodule
