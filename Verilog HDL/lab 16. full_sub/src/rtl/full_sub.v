module full_sub(a, b, br_0, out, br);

input [3:0] a;
input [3:0] b;
input [3:0] br_0;

output [3:0] out;
output [3:0] br;

wire ex_ab;
wire and_ab;
wire s_and_ab;

assign ex_ab = a ^ b;
assign and_ab = ~a & b;

assign s_and_ab = ~ex_ab & br_0;

assign out = ex_ab ^ br_0;
assign br = s_and_ab | and_ab;

endmodule