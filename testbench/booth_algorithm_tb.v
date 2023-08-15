
module testbench();

reg clk;
reg n_rst;

reg [3:0] in2;
reg [3:0] in1;

wire [8:0] out;

booth_algorithm inst_booth(
    .clk(clk),
    .n_rst(n_rst),
    .in2(in2),
    .in1(in1),
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
    in1 = 4'b0011;
    in2 = 4'b0111;

    #100;
    $stop;
end
endmodule

