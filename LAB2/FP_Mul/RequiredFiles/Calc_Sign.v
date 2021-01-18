module Calc_Sign(input sign1, input sign2, output sign); //calculates the final sign i.e. xor of sign1 and sign2
	assign sign = sign1^sign2;
endmodule