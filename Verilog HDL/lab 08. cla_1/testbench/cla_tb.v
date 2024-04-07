module testbench();

reg [3:0] a;
reg [3:0] b;
reg c_in;

wire [3:0] s;
wire [3:0] c_out;

cla inst_cla(
    .a(a),
    .b(b),
    .c_in(c_in),
    .c_out(c_out),
    .s(s)
);

initial begin
    a = 4'b0001;
    b = 4'b1010;
    c_in = 1'b0;

    #10;
    a = 4'b1110;
    b = 4'b0001;
    c_in = 1'b1;

    #10;
    a = 4'b1001;
    b = 4'b0011;

    #10;
    $stop;
    
end


endmodule

