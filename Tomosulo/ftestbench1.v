`include "Verilog_source_files/FloatingPointAdder32bit/FPA.v"
module top;
reg [31:0] a,b;
wire [31:0]out;FPA A(a, b, out);
initial
begin
a = 32'b01110001010010011111011111110110;
 b = 32'b01110001010010011111100010001000;
end
initial
$monitor("%b",out[31:0]);
endmodule