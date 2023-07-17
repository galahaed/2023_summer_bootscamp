module testbench();

reg clk;
reg n_rst;
reg x;

wire [2:0] out;

binary_counter inst_binary_counter(
    .clk(clk),
    .n_rst(n_rst),
    .x(x),
    .out(out)
);

always begin
    #4;
    clk = ~clk;
end

initial begin
    #0;
    clk = 0;
    n_rst = 0;
    x = 0;

    #4; 
    n_rst = 1;
    repeat(10) begin
        @ (posedge clk) begin
            x = 0;
        end 
    end

    repeat(10) begin
        @ (posedge clk) begin
            x = 1;
        end 
    end

    @(posedge clk) begin
        $stop;
    end
end

endmodule
