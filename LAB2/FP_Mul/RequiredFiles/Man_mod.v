module Man_mod(input [7:0]exponent, input [22:0]mantissa, output [23:0]modified_mantissa); //calculates the modified mantissa with the hidden 1
	assign modified_mantissa = {|exponent, mantissa};
endmodule