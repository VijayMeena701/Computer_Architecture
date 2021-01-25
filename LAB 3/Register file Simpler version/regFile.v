module registerFile (
		input writeEnable,					//write Enable input
		input [4:0] writeRegister,			//5bit write register destination address
		input [31:0] writeData,				//32bit data to be written on the register
		input [4:0] readRegister1,			//5bit source address1
		output [31:0] readData1,			//32bit Data in source address1
		input [4:0] readRegister2,			//5bit source address2
		output [31:0] readData2,			//32bit Data in source address2
		input clock							//clock input from the testbench
	);

	reg [31:0] regFile [31:0];						//32 registers of size 32 each
	assign readData1 = regFile[readRegister1];		//read data from the corresponding address
	assign readData2 = regFile[readRegister2];		//read data from the corresponding address

	always @(posedge clock)
		begin
			if(writeEnable)							//if writeEnable is set to 1,write the data to the register at the corresponding address
				begin
					regFile[writeRegister] <= writeData;
				end
		end
endmodule