module testbench();

reg clk;
reg n_rst;

reg x;

wire y;

pattern_checking inst_parttern_check(
    .clk(clk),
    .n_rst(n_rst),
    .x(x),
    .y(y)
);

always begin
    #20;
    clk = ~clk;
end

initial begin
    clk = 0;
    n_rst = 0;
    x = 1'b0;

    #20;
    x = 1'b1;

    #20;
    x = 1'b0;

    #20;
    $stop;
end

endmodule