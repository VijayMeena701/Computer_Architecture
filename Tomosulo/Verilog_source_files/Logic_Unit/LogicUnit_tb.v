`include"LogicUnit.v"

module LogicUnit_tb();

reg [31:0] IN1, IN2;
reg [2:0] opcode;
wire [31:0] OUT;
ALU A_0(OUT, IN1, IN2, opcode);

initial 
begin
    IN1 = 32'd7; 
    IN2 = 32'h619CD367;// opcodes
    #5 opcode = 3'b000;// 000 -> AND 
    #5 opcode = 3'b001;// 001 -> XOR 
    #5 opcode = 3'b010;// 010 -> NAND 
    #5 opcode = 3'b011;// 011 -> OR 
    #5 opcode = 3'b100;// 100 -> NOT 
    #5 opcode = 3'b101;// 101 -> NOR 
    #5 opcode = 3'b110;// 110 -> 2's complement 
    #5 opcode = 3'b111;// 111 -> XNOR 
end

initial begin
    $monitor($time, "op=%b IN1=%b\tIN2=%b \tOUT=%b\n", opcode, IN1, IN2, OUT);
end

endmodule