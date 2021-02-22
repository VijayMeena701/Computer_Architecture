`include "lvl.v"
`include "dff_lvl.v"

module ppc(y,layer,reset,clock,a,b,c,d);
    input [31:0][7:0]layer;
    input [31:0] a,b;

    wire [31:0][7:0]reg1,reg2,reg3,reg4,reg5;
    wire[31:0] wire6,wire7,wire8,wire9,wire10,wire11,wire12,wire13,wire14,wire15;

    output  [31:0][7:0] y ;
    output [31:0] c,d;
    wire  [31:0][7:0] wire1,wire2,wire3,wire4,wire5 ;

    input reset,clock;

    dff_lvl c1(layer,reset,clock,reg1,wire6,wire7,a,b); //pipeline-2
    lvl m1(wire1,reg1,3'd0);

    dff_lvl c2(wire1,reset,clock,reg2,wire8,wire9,wire6,wire7); //pipeline-3
    lvl m2(wire2,reg2,3'd1);

    dff_lvl c3(wire2,reset,clock,reg3,wire10,wire11,wire8,wire9); //pipeline-4
    lvl m3(wire3,reg3,3'd2);

    dff_lvl c4(wire3,reset,clock,reg4,wire12,wire13,wire10,wire11); //pipeline-5
    lvl m4(wire4,reg4,3'd3);

    dff_lvl c5(wire4,reset,clock,reg5,wire14,wire15,wire12,wire13); //pipeline-6
    lvl m5(wire5,reg5,3'd4);

    dff_lvl c6(wire5,reset,clock,y,c,d,wire14,wire15); //pipeline-7
endmodule
