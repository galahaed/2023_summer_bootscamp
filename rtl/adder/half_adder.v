module half_adder(
    a, 
    b,
    sum, 
    carry
);

// input part
input a;
input b;

// output part
output sum;
output carry;

// assignment part
assign sum = a ^ b;
assign carry = a & b;

endmodule