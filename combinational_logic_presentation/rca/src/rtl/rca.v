
module rca(a, b, c_in, s, c_out);

input [3:0] a;
input [3:0] b;
input [3:0] c_in; // carry in

output [3:0] s; // sum
output [3:0] c_out; // carry out

fa inst_fa0(.a(a[0]), .b(b[0]), .c_in(c_in[0]), .s(s[0]), .c_out(c_out[0]));
fa inst_fa1(.a(a[1]), .b(b[1]), .c_in(c_out[0]), .s(s[1]), .c_out(c_out[1]));
fa inst_fa2(.a(a[2]), .b(b[2]), .c_in(c_out[1]), .s(s[2]), .c_out(c_out[2]));
fa inst_fa3(.a(a[3]), .b(b[3]), .c_in(c_out[2]), .s(s[3]), .c_out(c_out[3]));


endmodule

module fa(a, b, c_in, s, c_out);

input a;
input b;
input c_in;

output s;
output c_out;

assign s = (a ^ b) ^ c_in;
assign c_out = ((a ^ b) & c_in) | (a & b);

endmodule
