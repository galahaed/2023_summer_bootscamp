module testbench();

reg x;
reg clk;
reg n_rst;

wire y;

moore_machine inst_moore_machine(
    .clk(clk),
    .n_rst(n_rst),
    .x(x),
    .y(y)
);

always begin
    #10;
    clk = ~clk;
end

initial begin
    n_rst = 0;
    clk = 1;
    x = 0;
    
    #20;
    n_rst = 1;
    x = 0;

    #20;
    x = 1;

    #20;
    x = 0;

    #20;
    x = 1;

    #60;
    $stop;

end

endmodule