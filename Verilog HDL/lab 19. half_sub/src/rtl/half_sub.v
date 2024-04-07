module half_sub(a, b, out, br);

input a;
input b;

output out;
output br;

assign out = a ^ b;
assign br = ~a & b;

endmodule