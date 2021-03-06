module RightShift (input [31:0]A, input [7:0]shift, output [31:0]B);
    genvar i;
    generate
    for (i = 0; i < 8'b11111111 ; i = i + 1) 
    begin

        wire [31:0]tmp;
        
        if(i <= 5'b11111)
            assign tmp = A[31:i];
        else 
            assign tmp = 32'b0;

        assign enable = ~|(shift ^ i);

        assign B[31:0] = enable ? tmp[31:0] : 32'bz;

    end
    endgenerate
endmodule

module BarrelShift (input [31:0]A, input [4:0]shift, output [31:0]B);
    genvar i;
    generate
    for (i = 0; i < 5'b11111 ; i = i + 1) 
    begin 

        wire [31:0]tmp;
        
        assign tmp = {A[i:0],A[31:i]};

        assign enable = ~|(shift ^ i);

        assign B[31:0] = enable ? tmp[31:0] : 32'bz;

    end
    endgenerate
endmodule
