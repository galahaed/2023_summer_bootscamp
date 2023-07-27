module testbench();
    reg enable;
    reg [1:0] sel;

    wire [3:0] data_out;

    demux inst_demux (
        .enable(enable),
        .select(sel),
        .out(data_out)
    );

    initial begin
        #0;
        enable = 0;
        sel = 2'b00;

        #5;
        enable = 1;
        
        #5; 
        sel = 2'b01;
        
        #5; 
        sel = 2'b10;
        
        #5; 
        sel = 2'b11;
        
        #5; 
        enable = 0;

        #5 $stop;
    end


endmodule
