module cla(a, b, c_in, s, c_out);

input [3:0] a;
input [3:0] b;
input c_in;

output [3:0] s;
output [3:0] c_out;

wire [3:0] p;
wire [3:0] g;

wire c1;
wire c2;
wire c3;
wire c4;

assign p[0] = a[0] ^ b[0];
assign p[1] = a[1] ^ b[1];
assign p[2] = a[2] ^ b[2];
assign p[3] = a[3] ^ b[3];

assign g[0] = a[0] & b[0];
assign g[1] = a[1] & b[1];
assign g[2] = a[2] & b[2];
assign g[3] = a[3] & b[3];

assign c1 = g[0] | p[0] & c_in;
assign c2 = g[1] | p[1] & g[0] | p[1] & p[0] & c_in;
assign c3 = g[2] | p[2] & g[1] | p[2] & p[1] & g[0] | p[2] & p[1] & p[0] & c_in;
assign c4 = g[3] | p[3] & g[2] | p[3] & p[2] & g[1] | p[3] & p[2] & p[1] & g[0] | p[3] & p[2] & p[1] & & p[0] & c_in;

assign s[0] = p[0] ^ c_in;
assign s[1] = p[1] ^ c1;
assign s[2] = p[2] ^ c2;
assign s[3] = p[3] ^ c3;

assign c_out = {c4, c3, c2, c1};

endmodule

/*
module cla(a, b, c_out, s);

input [3:0] a;
input [3:0] b;

output [3:0] c_out; // carry
output [3:0] s; // sum

wire [3:0] g;
wire [3:0] p;
wire [3:0] carry;

assign g = a & b;
assign p = a | b;

assign carry[0] = g[0];
assign carry[1] = carry[0] & p[0];
assign carry[2] = carry[1] & p[1];
assign carry[3] = carry[2] & p[2];

assign s[0] = a[0] ^ b[0] ^ 1'b0;
assign s[1] = a[1] ^ b[1] ^ carry[0];
assign s[2] = a[2] ^ b[2] ^ carry[1];
assign s[3] = a[3] ^ b[3] ^ carry[2];
    
assign c_out = g[3] | (p[3] & carry[2]);


endmodule
*/



/*
fa ins_fa0(.a(a[0]), .b(b[0]), .c_out(c_out), .s(s[0]));
fa ins_fa0(.a(a[1]), .b(b[0]), .c_out(c_out), .s(s[0]));
fa ins_fa0(.a(a[2]), .b(b[0]), .c_out(c_out), .s(s[0]));
fa ins_fa0(.a(a[3]), .b(b[0]), .c_out(c_out), .s(s[0]));


endmodule

module fa(a, b, c_out, s);

input a;
input b;

output c_out;
output s;

wire g;
wire p;
wire carry;

assign s = a ^ b ^ carry;
assign c_out = g | (p & carry);

endmodul*/