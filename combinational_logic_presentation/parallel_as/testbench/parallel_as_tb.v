module testbench();

reg [3:0] a;
reg [3:0] b;
reg sign;

wire [3:0] s;
wire [3:0] c_out;

parallel_add_sub_4bit inst_pas(
    .a(a),
    .b(b),
    .sign(sign),
    .s(s),
    .c_out(c_out)
);

initial begin
    a = 4'b0000;
    b = 4'b0010;
    sign = 1'b1;

    #10;
    a = 4'b0101;
    b = 4'b0011;
    sign = 1'b0;

    #10;
    a = 4'b1000;
    b = 4'b0110;
    sign = 1'b1;
    
    #10;
    a = 4'b1001;
    b = 4'b1000;
    sign = 1'b0;
    
    #10;
    $stop;
    
end

endmodule