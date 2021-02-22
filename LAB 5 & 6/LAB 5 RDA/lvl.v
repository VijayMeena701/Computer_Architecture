module lvl(out,inpA,k);

    input [31:0][7:0]inpA;
    output reg [31:0][7:0] out ;
    input [2:0] k;
    integer i=0,j=0;

    always@(*)
        begin//always begin
        j<=k;
        for(i=0;i<32;i=i+1)
            begin
                out[i]=inpA[i];
            end
        for(i=31;(i-2**j)>=0;i=i-1)
        begin
            if(out[i]=="k")
                begin
                    out[i]="k";
                end
            else if(out[i]=="p")
                begin
                    if(out[i-2**j]=="k")
                        out[i]="k";
                    else if(out[i-2**j]=="p")
                        out[i]="p";
                    else
                        out[i]="g";
                end
            else
                begin
                    out[i]="g";
                end
        end
        end
endmodule
