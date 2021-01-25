`include"Mux32way32bits.v"

module Mux32way32bits_tb();

reg [31:0] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, a30, a31;
reg [4:0] sel;
wire [31:0] out;

Mux32way32bits MUX(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, 
a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, 
a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, 
a30, a31, sel, out);

initial begin
    a0 = 32'hAEAEAE00;
    a1 = 32'hAEAEAE01;
    a2 = 32'hAEAEAE02;
    a3 = 32'hAEAEAE03;
    a4 = 32'hAEAEAE04;
    a5 = 32'hAEAEAE05;
    a6 = 32'hAEAEAE06;
    a7 = 32'hAEAEAE07;
    a8 = 32'hAEAEAE08;
    a9 = 32'hAEAEAE09;
    a10 = 32'hAEAEAE0A;
    a11 = 32'hAEAEAE0B;
    a12 = 32'hAEAEAE0C;
    a13 = 32'hAEAEAE0D;
    a14 = 32'hAEAEAE0E;
    a15 = 32'hAEAEAE0F;
    a16 = 32'hAEAEAE10;
    a17 = 32'hAEAEAE11;
    a18 = 32'hAEAEAE12;
    a19 = 32'hAEAEAE13;
    a20 = 32'hAEAEAE14;
    a21 = 32'hAEAEAE15;
    a22 = 32'hAEAEAE16;
    a23 = 32'hAEAEAE17;
    a24 = 32'hAEAEAE18;
    a25 = 32'hAEAEAE19;
    a26 = 32'hAEAEAE1A;
    a27 = 32'hAEAEAE1B;
    a28 = 32'hAEAEAE1C;
    a29 = 32'hAEAEAE1D;
    a30 = 32'hAEAEAE1E;
    a31 = 32'hAEAEAE1F;
    sel = 5'b00110;
    #20
    sel = 5'b11100;
    #20
    sel = 5'b00000;
    #20
    sel = 5'b11110;
    #20
    sel = 5'b11111;
end

initial begin
    $monitor($time, "sel = %b out = %h", sel[4:0], out[31:0]);
end

endmodule