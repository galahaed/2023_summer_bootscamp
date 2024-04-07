module testbench();

reg x;
reg clk;
reg rst;

wire y;

moore_machine inst_moore_machine(
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
    $stop;

end

endmodule