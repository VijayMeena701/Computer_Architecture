`include"Mux2way32bits.v"

module Mux2way32bits_tb();

reg [31:0] a, b;
reg sel;
wire [31:0] out;

Mux2way32bits MUX2(a, b, sel, out);

initial begin
    a = 32'hAEAEAEAE;
    b = 32'h87878787;
    sel = 1'b0;
    #20
    sel = 1'b1;
end

initial begin
    $monitor($time, "a = %h b = %h sel = %b out = %h", a[31:0], b[31:0], sel, out[31:0]);
end

endmodule