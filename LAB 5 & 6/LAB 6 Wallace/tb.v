`include "32wallace.v"

module top;
reg  signed [32:0]a,b;
integer i;
wire signed [64:0] c;
reg clk,rst;

wallace w_0(c,a,b,clk,rst);

initial
begin
#0  a=19; b=15;
#5  a=9943000; b=3302367;
#10  a=32'hffff_ff3a; b=32'hff3a_ffff;
#5  a=25983; b=641987;
#10  a=32'habcd_ef3a; b=32'habca_ffff;
end

initial
begin
clk=1;
rst=0;
rst=1;
for (i=0;i<60;i++)
#1 clk=~clk;
end

initial
 begin
 	$monitor($time,": A=%d\tB =%d;\tOutput:=%d\t",a,b,c);
 
end
endmodule
