module testbench();

reg a2, b2;
wire out2;

nand_gate u_nand_gate(
    .a2(a2),
    .b2(b2),
    .out2(out2)
);

initial begin
    a2 = 0; b3 = 0;

    #4
    a2 = 0; b2 = 1;

    #4
    a2 = 1; b2 = 0;

    #4
    a2 = 1; b2 = 1;

    #4 
    $stop;
end;

endmodule
