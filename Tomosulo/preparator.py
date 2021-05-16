
# makes the testbench string
def getfileString(a, b,opname):
    tb_string = ""
    flag = 0
    t = "module top;\nreg [31:0] a,b;\nwire [31:0]out;"
    if(opname == 'ADD'):
        tb_string = '`include \"Verilog_source_files/RecursiveAdder32bit/RecursiveAdder.v\"\n' + t + 'RecursiveAdder A(out, a, b);\n'
    elif(opname == 'FADD'):
        tb_string = '`include "Verilog_source_files/FloatingPointAdder32bit/FPA.v"\n'+t+ 'FPA A(a, b, out);\n'
    elif(opname == 'MUL'):
        tb_string = '`include "Verilog_source_files/WallaceMultiplier32bit/WallaceMultiplier.v"\n'+t+ 'WallaceMultiplier M(out, a, b);\n'
    elif(opname == 'FMUL'):
        tb_string = '`include "Verilog_source_files/FloatingPointMultiplier32bit/FPM.v"\n' + t + 'FPM M(a, b, out);\n'
    else:
        flag = 1
        odict = {"AND":'3\'b000',"XOR":'3\'b001',"OR":"3\'b011"}
        opcode = odict[opname]
        nstring = "`include\"LogicUnit.v\"\nmodule LogicUnit_tb();\nreg [31:0] a, b;"
        nstring += "\nreg [2:0] opcode;\nwire [31:0] out;\nALU A_0(out, a, b, opcode);"
        nstring += "initial\nbegin\n" + "a = " +a + ";\nb = " + b +";"
        nstring += "opcode = " + opcode + ";\nend"
        nstring += "initial\n$monitor(\"%b\",out[31:0]);\nendmodule"

    tb_string += "initial\nbegin\n" + "a = 32'b" + a +";\nb = 32'b" + b +";\nend\n"
    tb_string += "initial\n$monitor(\"%b\",out[31:0]);\nendmodule"
    if(flag):
        return nstring
    return tb_string

# prepares the 'testbench' for execution
def prepare_file(filename, a, b, opname):
    tb_string = getfileString(a, b, opname=opname)
    input_file = open(filename, "w")
    input_file.write(tb_string)
    input_file.close()
