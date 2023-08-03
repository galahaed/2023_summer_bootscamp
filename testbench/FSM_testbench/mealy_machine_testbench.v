module testbench();

reg clk;
reg rst;
reg x;

wire y;

mealy_machine inst_mealy_machine(
    .clk(clk),
    .rst(rst),
    .x(x),
    .y(y)
);

always begin
    #10;
    clk = ~clk;
end

initial begin
    rst = 0;
    clk = 1;
    x = 0;
  
    #20; 
    rst = 1;
    x = 0;

    #20;
    x = 1;

    #20; 
    x = 0;

    #20; 
    x = 1;

    #20; 
    x = 0;
    
    #20;
    x = 1;

    #20;
    $stop;
end


endmodule