

module HalfAdder(q1, q0, p0, p1); // q0 is same column, q1 is next column

input p0, p1;
output q0, q1;

xor xor_1(q0, p0, p1);
and and_1(q1, p0, p1);

endmodule
