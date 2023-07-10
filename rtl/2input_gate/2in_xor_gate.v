module xor_gate(input a, input b, output F);

assign F = a^b;
/*assign F = ~(a & b) & (a | b);*/

endmodule