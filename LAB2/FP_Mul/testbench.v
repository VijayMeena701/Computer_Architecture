`include "SPFP_Mul.v"

module testbench;

    reg[31:0] val1, val2;
    wire [31:0]out;
    SPFP_Multiplier mul(val1, val2, out);
    initial
        begin
            #0 val1={1'b0,{8{1'b1}},23'b0}; val2={1'b0,{7{1'b1}},24'b111011}; 
            #10 val1={31'b0,1'b1}; val2=32'b00111111110010100011110101110001;  
            #20 val1=32'b01000010111110100100000000000000; val2=32'b01000001010000010000000000000000;
            #30 val1={1'b0,{8{1'b1}},23'b0}; val2={31'b0,1'b1}; 
        end
    initial
        begin
            $monitor($time,"Value1=%b Value2=%b Result=%b\n", val1, val2, out);
        end

endmodule