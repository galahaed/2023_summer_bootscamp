
module parallel_add_sub_4bit(a, b, sign, s, c_out);

input [3:0] a;
input [3:0] b;
input sign;

output [3:0] s; // sum
output [3:0] c_out; // carry out

reg [3:0] bs;
reg [3:0] c_in;

always @(*) begin
    if (~sign) begin
        bs = b ^ 4'b0000;
        c_in[0] = 4'b0000;
    end
    
    else begin // if (sign)
        bs = b ^ 4'b1111;
        c_in[0] = 4'b1111;
    end
end

fadd inst_fa0(.a(a[0]), .bs(bs[0]), .c_in(c_in[0]), .c_out(c_out[0]), .s(s[0]));
fadd inst_fa1(.a(a[1]), .bs(bs[1]), .c_in(c_out[0]), .c_out(c_out[1]), .s(s[1]));
fadd inst_fa2(.a(a[2]), .bs(bs[2]), .c_in(c_out[1]), .c_out(c_out[2]), .s(s[2]));
fadd inst_fa3(.a(a[3]), .bs(bs[3]), .c_in(c_out[2]), .c_out(c_out[3]), .s(s[3]));

// carry 1비트 부족?
endmodule


module fadd(a, bs, c_in, c_out, s);

input a;
input bs;
input c_in;

output c_out;
output s;


assign s = (a ^ bs) ^ c_in;
assign c_out = ((a ^ bs) & c_in) | (a & bs);


endmodule