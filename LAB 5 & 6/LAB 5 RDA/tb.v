`include "adder32bit.v"

module top;
	reg signed [31:0]inpA,inpB;
	reg[7:0] X_In;
	wire signed [31:0]outS;
	wire[7:0]xout;
	reg clock,reset;
	adder adder_0(outS,xout,inpA,inpB,X_In,clock,reset);
	integer i;

	initial
		begin
		#0 X_In="k"; inpA=36865; inpB=33023;
		#3 X_In="k"; inpA=9943121; inpB=-3302367;
		#4 X_In="k"; inpA=-3686; inpB=3023;
		#4 X_In="k"; inpA=2; inpB=2;
		#4 X_In="k"; inpA=4; inpB=4;

		end
		
	initial
		begin
		clock=1;
		reset=0;
		reset=1;
		for (i=0;i<30;i++)
		#1 clock=~clock;
		end

	initial
		begin
			$monitor($time,": X=%0d\tY=%0d\tOutput: Sum=%0d",inpA,inpB,outS);
		end
endmodule

