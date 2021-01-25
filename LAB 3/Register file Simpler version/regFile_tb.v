`include "regFile.v"
module registerFile_tb();

	reg wrEnable;
	reg [4:0] wrReg;
	reg [31:0] wrData;
	reg [4:0] rdReg1;
	wire [31:0] rdData1;
	reg [4:0] rdReg2;
	wire [31:0] rdData2;
	reg clk;
	reg [5:0] index;

	always begin
        #5
        clk = ~clk;
    end

    registerFile regFile1 (wrEnable, wrReg, wrData, rdReg1, rdData1, rdReg2, rdData2, clk);

	initial 
    begin
		clk = 0;
		wrEnable = 1;
		for (index = 0; index < 10; index = index + 1)
            begin
                #10
                wrReg = index;
                wrData = index * 2;
                $display($time,"\tWrite Address:%d Write Data:%d", wrReg, wrData);
            end
        $display("\n\n\n");
        #10 rdReg1 = 0; rdReg2 = 1;
        #10 rdReg1 = 2; rdReg2 = 3;
        #10 rdReg1 = 4; rdReg2 = 5;
        #10 rdReg1 = 6; rdReg2 = 7;
        #10 rdReg1 = 8; rdReg2 = 9;
    end
    initial begin
        $monitor($time,"\tRead Address1:%d ReadData1:%d :: :: Read Address2:%d ReadData2:%d",rdReg1, rdData1, rdReg2, rdData2);
    end
endmodule