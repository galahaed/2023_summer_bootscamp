module testbench();

reg [3:0] a;
reg [3:0] b;
reg c_in;

wire c_out;
wire [3:0] s;

rca inst_rca(
    .a(a),
    .b(b),
    .c_in(c_in),
    .c_out(c_out),
    .s(s)
);

initial
begin
    #0;
    c_in = 1'b0;
    a = 4'b0000;
    b = 4'b0001;

    #5;
    a = 4'b0001;
    b = 4'b0011;

    #5;
    a = 4'b0011;
    b = 4'b0111;

    #5;
    a = 4'b0111;
    b = 4'b1111;

    #10; 
    $stop;
end

endmodule


