`include "Verilog_source_files/WallaceMultiplier32bit/WallaceMultiplier.v"
module top;
reg [31:0] a,b;
wire [31:0]out;WallaceMultiplier M(out, a, b);
initial
begin
a = 32'b00000000000000000000001100111001;
b = 32'b00000000000000000000000000000000;
end
initial
$monitor("%b",out[31:0]);
endmodule