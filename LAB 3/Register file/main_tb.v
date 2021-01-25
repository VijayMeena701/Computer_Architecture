`include"main.v"

module main_tb();

reg [4:0] srcadd1, srcadd2, destadd;
reg [31:0] ALUout;
wire [31:0] src1, src2;

main MAIN(srcadd1, srcadd2, destadd, ALUout, src1, src2);

initial begin
    destadd = 5'd0;
    ALUout = 32'hAEAEAE00;
    #10
    destadd = 5'd1;
    ALUout = 32'hAEAEAE01;
    #10
    destadd = 5'd2;
    ALUout = 32'hAEAEAE02;
    #10
    destadd = 5'd3;
    ALUout = 32'hAEAEAE03;
    #10
    destadd = 5'd4;
    ALUout = 32'hAEAEAE04;
    #10
    destadd = 5'd5;
    ALUout = 32'hAEAEAE05;
    #10
    destadd = 5'd6;
    ALUout = 32'hAEAEAE06;
    #10
    destadd = 5'd7;
    ALUout = 32'hAEAEAE07;
    #10
    destadd = 5'd8;
    ALUout = 32'hAEAEAE08;
    #10
    destadd = 5'd9;
    ALUout = 32'hAEAEAE09;
    #10
    destadd = 5'd10;
    ALUout = 32'hAEAEAE0A;
    #10
    destadd = 5'd11;
    ALUout = 32'hAEAEAE0B;
    #10
    destadd = 5'd12;
    ALUout = 32'hAEAEAE0C;
    #10
    destadd = 5'd13;
    ALUout = 32'hAEAEAE0D;
    #10
    destadd = 5'd14;
    ALUout = 32'hAEAEAE0E;
    #10
    destadd = 5'd15;
    ALUout = 32'hAEAEAE0F;
    #10
    destadd = 5'd16;
    ALUout = 32'hAEAEAE10;
    #10
    destadd = 5'd17;
    ALUout = 32'hAEAEAE11;
    #10
    destadd = 5'd18;
    ALUout = 32'hAEAEAE12;
    #10
    destadd = 5'd19;
    ALUout = 32'hAEAEAE13;
    #10
    destadd = 5'd20;
    ALUout = 32'hAEAEAE14;
    #10
    destadd = 5'd21;
    ALUout = 32'hAEAEAE15;
    #10
    destadd = 5'd22;
    ALUout = 32'hAEAEAE16;
    #10
    destadd = 5'd23;
    ALUout = 32'hAEAEAE17;
    #10
    destadd = 5'd24;
    ALUout = 32'hAEAEAE18;
    #10
    destadd = 5'd25;
    ALUout = 32'hAEAEAE19;
    #10
    destadd = 5'd26;
    ALUout = 32'hAEAEAE1A;
    #10
    destadd = 5'd27;
    ALUout = 32'hAEAEAE1B;
    #10
    destadd = 5'd28;
    ALUout = 32'hAEAEAE1C;
    #10
    destadd = 5'd29;
    ALUout = 32'hAEAEAE1D;
    #10
    destadd = 5'd30;
    ALUout = 32'hAEAEAE1E;
    #10
    destadd = 5'd31;
    ALUout = 32'hAEAEAE1F;
    #10
    srcadd1 = 5'b00110;
    srcadd2 = 5'b11100;
    destadd = 5'b00000;
    ALUout = 32'h33333333;
    #20
    srcadd1 = 5'b11110;
    srcadd2 = 5'b11111;
    #10
    srcadd1 = 5'd0;
    srcadd2 = 5'd1;
    destadd = 5'd1;
    ALUout = 32'h44444444;
    #10
    srcadd1 = 5'd0;
    srcadd2 = 5'd1;
    destadd = 5'd2;
    ALUout = 32'h55555555;
end

initial begin
    $monitor($time, "srcadd1 = %b srcadd2 = %b destadd = %b ALUout = %h src1 = %h src2 = %h", srcadd1, srcadd2, destadd, ALUout, src1, src2);
end

endmodule