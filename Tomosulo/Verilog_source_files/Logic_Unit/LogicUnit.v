`include"and32.v"
`include"xor32.v"
`include"nand32.v"
`include"or32.v"
`include"nor32.v"
`include"twoscomp32.v"
`include"xnor32.v"

// opcodes
// 000 -> AND
// 001 -> XOR
// 010 -> NAND
// 011 -> OR
// 100 -> NOT
// 101 -> NOR
// 110 -> 2's complement
// 111 -> XNOR

module ALU (OUT, IN1, IN2, opcode);

input [31:0] IN1, IN2;
input [2:0] opcode;
output reg [31:0] OUT;

wire [31:0] out_and, out_xor, out_nand, out_or, out_not, out_nor, out_2scomp, out_xnor;

and32 AND32(out_and, IN1, IN2);
xor32 XOR32(out_xor, IN1, IN2);
nand32 NAND32(out_nand, IN1, IN2);
or32 OR32(out_or, IN1, IN2);
not32 NOT32(out_not, IN1);
nor32 NOR32(out_nor, IN1, IN2);
twoscomp32 TWOSCOMP(out_2scomp, IN1);
xnor32 XNOR32(out_xnor, IN1, IN2);

always @(*) begin        
    case(opcode)
        3'b000 :    begin      // AND
            OUT = out_and;
        end
        3'b001 :    begin      // XOR
            OUT = out_xor;
        end
        3'b010 :    begin      // NAND
            OUT = out_nand;
        end
        3'b011 :    begin      // OR
            OUT = out_or;
        end
        3'b100 :    begin      // NOT
            OUT = out_not;
        end
        3'b101 :    begin
            OUT = out_nor; // NOR
        end
        3'b110 :    begin      // 2s complement
            OUT = out_2scomp;
        end
        3'b111 :    begin        // XNOR
            OUT = out_xnor;
        end
        default :    begin
            OUT = 32'bx;
        end
    endcase
end
endmodule