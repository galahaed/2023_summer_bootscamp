module testbench();

reg clk;
reg n_rst;

reg [3:0] a;
reg [3:0] b;

wire [7:0] out;

shift_add_multi_4bit inst_sam_4bit(
    .clk(clk),
    .n_rst(n_rst),
    .a(a),
    .b(b),
    .out(out)
);

always begin
    #10;
    clk = ~clk;
end

initial begin
    clk = 1;
    n_rst = 0;
    a = 4'b0000;
    b = 4'b0000;

    #20;
    n_rst = 1;
    a = 4'b1111;
    b = 4'b1111;
    
    #20;
    a = 4'b1011;
    b = 4'b1010;
    
    #20;
a    $stop;

end

endmodule