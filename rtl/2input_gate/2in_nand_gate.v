module nand_gate(
    input a2, b2,
    input a3, b3, c3,
    output out2, out3
);

assign out2 = ~(a2 & b2);
assign out3 = ~(a3 & b3 & c3);

endmodule