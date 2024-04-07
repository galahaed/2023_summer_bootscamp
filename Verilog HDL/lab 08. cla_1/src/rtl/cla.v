
// 4bit Carry Looks Ahead

module cla(a, b, c_out, sum);

input [3:0] a;
input [3:0] b;

output c_out;
output [3:0] sum;

wire [3:0] g;
wire [3:0] p;
wire [3:0] carry;

assign g = a & b;
assign p = a | b;
    
assign carry[0] = g[0];
assign carry[1] = carry[0] & p[0];
assign carry[2] = carry[1] & p[1];
assign carry[3] = carry[2] & p[2];
    
assign sum[0] = a[0] ^ b[0] ^ 1'b0;
assign sum[1] = a[1] ^ b[1] ^ carry[0];
assign sum[2] = a[2] ^ b[2] ^ carry[1];
assign sum[3] = a[3] ^ b[3] ^ carry[2];
    
assign c_out = g[3] | (p[3] & carry[2]);

endmodule