module add_sub_cla(
    input [3:0] a,
    input [3:0] b,
    input sign,

    output [3:0] c_out,
    output [3:0] sum
);

parameter ms = 4; // memory state

reg [ms - 1:0] bb;
reg [ms - 1:0] c_in;

wire [ms - 1:0] p;
wire [ms - 1:0] g;

always @(*) begin
    if (sign) begin
        bb = ~b + 4'b0001;
    end

    else begin
        bb = b;
    end
end


propagating instp_0(.p(p[0]), .a(a[0]), .b(bb[0]));
propagating instp_1(.p(p[1]), .a(a[1]), .b(bb[1]));
propagating instp_2(.p(p[2]), .a(a[2]), .b(bb[2]));
propagating instp_3(.p(p[3]), .a(a[3]), .b(bb[3]));


generating instg_0(.g(g[0]), .a(a[0]), .b(bb[0]));
generating instg_1(.g(g[1]), .a(a[1]), .b(bb[1]));
generating instg_2(.g(g[2]), .a(a[2]), .b(bb[2]));
generating instg_3(.g(g[3]), .a(a[3]), .b(bb[3]));


assign c_in[0] = g[0] | p[0] & c_in;
assign c_in[1] = g[1] | p[1] & g[0] | p[1] & p[0] & c_in;
assign c_in[2] = g[2] | p[2] & g[1] | p[2] & p[1] & g[0] | p[2] & p[1] & p[0] & c_in;
assign c_in[3] = g[3] | p[3] & g[2] | p[3] & p[2] & g[1] | p[3] & p[2] & p[1] & g[0] | p[3] & p[2] & p[1] & & p[0] & c_in;


sum insts_0(.s(s[0]), .p(p[0]), .c(1'b0));
sum insts_1(.s(s[1]), .a(p[1]), .c(c_in[0]));
sum insts_2(.s(s[2]), .a(p[2]), c(c_in[1]));
sum insts_3(.s(s[3]), .a(p[3]), c(c_in[2]));

assign c_out = c_in;

endmodule


module propagating(
    input a,
    input b,
    
    output p
);

assign p = a ^ b;

endmodule


module generating(
    input a,
    input b,

    output g
);

assign g = a & b;

endmodule


module sum(
    input p,
    input c,

    output s
);

assign s = p ^ c;

endmodule