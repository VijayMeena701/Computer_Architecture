module cache;

    reg [511:0]Main_Memory[1023:0];             //Main Memory
    reg [15:0][31:0]Cache_Memory[7:0];          //Cache Memory of 8 blocks with 16 words of 32bits each.
    reg [7:0]CacheTag[7:0];                     //Cache Tags
    reg [1:0]CacheFlags[7:0];                   //Flags for data
    reg [14:0]PhysicalMemoryAddr;
    reg AccessMode;                             //1 => Read, 0=> Write
    reg [31:0]Data;                             //Data Stored in the Address
    integer i = 1;                              //For Clk & loop
    reg clock;                                  //For clock cycles


    always @(posedge clock)
    begin
        //Replace previous data in memory if the corresponding cache was dirtied.
        if(CacheFlags[PhysicalMemoryAddr[6:4]]==2'b11 && CacheTag[PhysicalMemoryAddr[6:4]]!=PhysicalMemoryAddr[14:7])
            begin               //if data is valid and dirty && tag address is != physical address, update mainmemory
                Main_Memory[{CacheTag[PhysicalMemoryAddr[6:4]],PhysicalMemoryAddr[6:4]}] = Cache_Memory[PhysicalMemoryAddr[6:4]];
                CacheFlags[PhysicalMemoryAddr[6:4]] = 2'b10;
                $display("Memory Updated\n");
            end

        if(AccessMode == 1'b1)      //if accessmode is read mode
        begin
            //If the data is not present in Cache load it from memory
            if(CacheTag[PhysicalMemoryAddr[6:4]]!=PhysicalMemoryAddr[14:7] || CacheFlags[PhysicalMemoryAddr[6:4]][1] == 1'b0)
                begin           //if tag is not == to physical address, load the data or if the dirty bit is set, reload the data
                    Cache_Memory[PhysicalMemoryAddr[6:4]] = Main_Memory[PhysicalMemoryAddr[14:4]];
                    CacheFlags[PhysicalMemoryAddr[6:4]] = 2'b10;
                    CacheTag[PhysicalMemoryAddr[6:4]] = PhysicalMemoryAddr[14:7];
                    $display("Read Miss\n");
                end
            Data = Cache_Memory[PhysicalMemoryAddr[6:4]][PhysicalMemoryAddr[3:0]];
        end

        if(AccessMode == 1'b0)      // if accessmode is write mode,
        begin
            //If the data is not present in Cache load it from memory
            if(CacheTag[PhysicalMemoryAddr[6:4]]!=PhysicalMemoryAddr[14:7] || CacheFlags[PhysicalMemoryAddr[6:4]][1] == 1'b0)
                begin           //if tag is not same as physical address load it or if the dirty bit is set, reload the data
                    Cache_Memory[PhysicalMemoryAddr[6:4]] = Main_Memory[PhysicalMemoryAddr[14:4]];  
                    CacheFlags[PhysicalMemoryAddr[6:4]] = 2'b11;
                    CacheTag[PhysicalMemoryAddr[6:4]] = PhysicalMemoryAddr[14:7];
                    $display("Write Miss\n");
                end
            Cache_Memory[PhysicalMemoryAddr[6:4]][PhysicalMemoryAddr[3:0]] = Data;
            CacheFlags[PhysicalMemoryAddr[6:4]][0] = 2'b11;
        end
    end

    //Intiialize the Memory,Cache Tags at Program start
    initial
        begin
            for(i=0;i<1024;i=i+1)
                Main_Memory[i] = i;
            for(i=0;i<8;i=i+1)
                CacheFlags[i] = 2'b0;
        end

    initial 
        begin
            #0 clock <= 1;
            for(i=0;i<17;i=i+1)
                begin
                    #5 clock <= ~clock;
                end
        end
    initial 
    begin
        //read initial data
        #0  AccessMode = 1'b1; PhysicalMemoryAddr = 14'd90;                     // read mode at address 90
        #10 AccessMode = 1'b0; PhysicalMemoryAddr = 14'd90; Data = 32'd240;     // write at address 90 data is 240
        #10 AccessMode = 1'b1; PhysicalMemoryAddr = 14'd90;                     // read the data from address 90.
        #10 AccessMode = 1'b1; PhysicalMemoryAddr = 14'd128;                    // read data from address 128
        #10 AccessMode = 1'b1; PhysicalMemoryAddr = 14'd0;                      // read data from address 0.
        #10 AccessMode = 1'b1; PhysicalMemoryAddr = 14'd128;                    // read data from address 128
        #10 AccessMode = 1'b0; PhysicalMemoryAddr = 14'd0; Data = 32'd420;      // write data to address 0
        #10 AccessMode = 1'b1; PhysicalMemoryAddr = 14'd19;                     // read data from address 19
        #10 AccessMode = 1'b0; PhysicalMemoryAddr = 14'd17; Data = 32'd20;      // write data to address 17
        #10 AccessMode = 1'b1; PhysicalMemoryAddr = 14'd0;                      // read data from address 0
    end

    initial
    begin
        $monitor($time," Clk=%b, AccessMode=%b , MemoryAdress=%d ,Data=%d",clock,AccessMode,PhysicalMemoryAddr,Data);
    end

endmodule
