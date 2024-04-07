module full_adder(a, b, c_in, s, c_out);

input a;
input b;
input c_in;

output s;
output c_out;

assign s = (a ^ b) ^ c_in;
assign c_out = (a & b) | ((a ^ b) & c_in);

endmodule

/*
module full_adder(a, b, c_in, s, c_out);

input a;
input b;
input c_in;

output s;
output c_out;

wire x;
wire y;
wire z;

assign x = a ^ b;
assign z = a & b;
assign s = x ^ c_in;

assign y = x & c_in;
assign c_out = y | z;

endmodule
*/