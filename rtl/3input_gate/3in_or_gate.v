module or_gate_3input (
    input a, b, c,
    output F

);

assign F = a | b | c;

endmodule