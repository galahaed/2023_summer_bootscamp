
module add_sub_4bit();

input   [3:0]   a;
input   [3:0]   b;
input           sign;

output  [3:0]   out;

reg     [3:0]   xor_b;

wire            com2;
wire            c_in;
wire            c_out;

assign xor_b = sign;

always @(b, sign) begin
    if (!sign) begin
        xor_b = b ^ xor_b;
    end

    else begin  // sign == 1
        con2 = ~xor_b + 4'b0001;
        xor_b = b ^ con2;
    end  
    
end

fa inst_fa_0(.a(a[0]), .b(xor_b[0]), .c_in(xor_b), .c_out(c_out), .s(s[0]));
fa inst_fa_1(.a(a[1]), .b(xor_b[1]), .c_in(xor_b), .c_out(c_out), .s(s[1]));
fa inst_fa_2(.a(a[2]), .b(xor_b[2]), .c_in(xor_b), .c_out(c_out), .s(s[2]));
fa inst_fa_3(.a(a[3]), .b(xor_b[3]), .c_in(xor_b), .c_out(c_out), .s(s[3]));

endmodule


module fa(a, b, c_in, c_out, s);  // full adder

input   a;
input   b;
input   c_in;

output  s;
output  c_out;

wire c1;
wire c2;
wire ms;

ha inst_ha_1(.a(a), .b(b), .carry(c1), .sum(ms));
ha inst_ha_2(.a(ms), .b(c_in), .carry(c2), .sum(s));

assign c_out = c1 | c2;
endmodule


module ha(a, b, sum, carry);  // half adder

input a;
input b;

output sum;
output carry;

assign sum = a ^ b;
assign carry = a & b;

endmodule


/*
module add_sub_4bit(a, b, sign, c_out, s);

input  [3:0] a;
input  [3:0] b;
input sign;

output  [3:0] c_out; // carry_out
output  [3:0] s; // sum

reg [3:0] bb;

always @(sign) begin
    if (sign) begin
        bb = ~b + 4'b0001;
    end

    else begin
        bb = b;
    end
end

full_adder inst_fa0(.a(a[0]), .b(bb[0]), .c_in(1'b0), .c_out(c_out[0]), .s(s[0]));
full_adder inst_fa1(.a(a[1]), .b(bb[1]), .c_in(c_out[0]), .c_out(c_out[1]), .s(s[1]));
full_adder inst_fa2(.a(a[2]), .b(bb[2]), .c_in(c_out[1]), .c_out(c_out[2]), .s(s[2]));
full_adder inst_fa3(.a(a[3]), .b(bb[3]), .c_in(c_out[2]), .c_out(c_out[3]), .s(s[3]));

endmodule


module full_adder(a, b, c_in, c_out, s);

input a;
input b;
input c_in;

output c_out;
output s;

wire c1;
wire c2;
wire mid_s;

half_adder inst_ha0(.a(a), .b(b), .c(c1), .s(mid_s));
half_adder inst_ha1(.a(mid_s), .b(c1), .c(c2), .s(s));

assign c_out = c1 | c2;

endmodule


module half_adder(a, b, s, c);

input a;
input b;

output s;
output c;

xor (s, a, b);
and (c, a, b);

endmodule
*/


/*
module add_sub_4bit(a, b, sign, c_out, s);

input [3:0] a;
input [3:0] b;
input sign;

output [3:0] c_out; // carry_out
output [3:0] s; // sum

if (!sign) begin
    full_adder inst_fa0(.a(a[0]), .b(b[0]), .c_in(sign), .c_out(c_out[0]), .s(s[0]));
    full_adder inst_fa1(.a(a[1]), .b(b[1]), .c_in(c_out[0]), .c_out(c_out[1]), .s(s[1]));
    full_adder inst_fa2(.a(a[2]), .b(b[2]), .c_in(c_out[1]), .c_out(c_out[2]), .s(s[2]));
    full_adder inst_fa3(.a(a[3]), .b(b[3]), .c_in(c_out[2]), .c_out(c_out[3]), .s(s[3]));
end

else begin
    b = ~b + 4'b0001;
    full_adder inst_fa0(.a(a[0]), .b(b[0]), .c_in(sign), .c_out(c_out[0]), .s(s[0]));
    full_adder inst_fa1(.a(a[1]), .b(b[1]), .c_in(c_out[0]), .c_out(c_out[1]), .s(s[1]));
    full_adder inst_fa2(.a(a[2]), .b(b[2]), .c_in(c_out[1]), .c_out(c_out[2]), .s(s[2]));
    full_adder inst_fa3(.a(a[3]), .b(b[3]), .c_in(c_out[2]), .c_out(c_out[3]), .s(s[3]));
end
endmodule


module full_adder(a, b, c_in, c_out, s);

input a;
input b;
input c_in;

output c_out;
output s;

wire c1;
wire c2;
wire mid_s;

half_adder inst_ha0(.a(a), .b(b), .c(c1), .s(mid_s));
half_adder inst_ha1(.a(mid_s), .b(c1), .c(c2), .s(s));

assign c_out = c1 || c2;

endmodule


module half_adder(a, b, s, c);

input a;
input b;

output s;
output c;

xor (s, a, b);
and (c, a, b);

endmodule
*/