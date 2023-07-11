module full_adder(
    a,
    b,
    sum,
    carry_in,
    carry_out
);

// input part
input a;
input b;
input carry_in;

// output part 
output sum;
output carry_out;

// assignment part
assign sum = (a ^ b) ^ carry_in;
assign carry_out = (carry_in & (a ^ b)) | (a & b);

endmodule