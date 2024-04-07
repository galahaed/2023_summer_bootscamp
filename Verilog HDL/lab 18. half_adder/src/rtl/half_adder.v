module half_adder(a, b, s, c);

input a;
input b;

output s; // sum
output c; // carry out

assign s = a ^ b;
assign c = a & b;

endmodule
