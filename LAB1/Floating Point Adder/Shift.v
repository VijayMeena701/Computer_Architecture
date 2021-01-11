module Shift(input [31:0]inp, input [7:0]shift, output [31:0]outp);
    assign outp = inp>>shift;
endmodule
