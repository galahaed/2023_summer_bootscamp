module xor_gate_3input (
    input a, b, c,
    output F

);

assign F = a ^ b ^ c;
/* assign F = ~(a & b & c) & (a | b | c); */
endmodule