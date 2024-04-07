module testbench();

reg clk;
reg n_rst;

reg [3:0] in1;
reg [3:0] in2; 

wire [7:0] out;

booth_algorithm inst_ba(
    .clk(clk),
    .n_rst(n_rst),
    .in1(in1),
    .in2(in2),
    .out(out)
);

always begin
    #10;
    clk = ~clk;
end

initial begin
    clk = 1;
    n_rst = 0;
    in1 = 4'b0;
    in2 = 4'b0;
    
    #20;
    n_rst = 1;
    in1 = 4'b1000;
    in2 = 4'b0010;

    #100;
    $stop;
end
endmodule