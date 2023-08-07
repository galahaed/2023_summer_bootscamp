module testbench();

reg [3:0] a;
reg [3:0] b;
reg [3:0] c_in;

wire s;
wire [3:0] c_out;

rca inst_rca(
    .a(a),
    .b(b),
    .c_in(c_in), 
    .s(s),
    .c_out(c_out)
);

initial begin
    a = 4'b0000;
    b = 4'b0010;
    c_in = 1'b1;

    #10;
    a = 4'b0101;
    b = 4'b0011;
    c_in = 1'b0;

    #10;
    a = 4'b1000;
    b = 4'b0110;
    c_in = 1'b0;
    
    #10;
    a = 4'b1001;
    b = 4'b1000;
    c_in = 1'b1;
    
    #10;
    $stop;
    
end

endmodule