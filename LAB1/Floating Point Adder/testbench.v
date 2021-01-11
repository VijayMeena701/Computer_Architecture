`include "FPA.v"
module testbench;

    reg[31:0] X1, X2;
    wire [31:0]out;
    FPA add(X1, X2, out);
    initial
    begin
        #0 X1={1'b0,{8{1'b1}},23'b0}; X2={1'b0,{7{1'b1}},24'b111011};//infinity case
        #10 X1={32'b0}; X2={1'b0,{8{1'b1}},23'b0};//infinity + zero
        #20 X1=32'b00111110100000000000000000000000; X2=32'b01000010110010000000000000000000;// 0.25 and 10
        #30 X1=32'b01000011000000000000000000000000; X2=32'b01000010001000000000000000000000;//128 and 40
    end
    initial
    begin
        $monitor($time, " X1=%b\tX2=%b\tResult=%b\t",X1,X2,out);
    end

endmodule