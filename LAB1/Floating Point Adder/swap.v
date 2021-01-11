module Swap(input [31:0]input1, input [31:0]input2, output reg [31:0]out1, output reg [31:0]out2);

    always @(input1 | input2)
    begin
        if(input2[30:0]>input1[30:0])
        begin
            out2 = input1;
            out1 = input2;
        end
        else
        begin
            out1 = input1;
            out2 = input2;
        end
    end

endmodule
