module testbench();

reg a2, b2;
wire out2;

nor_gate ins_nor_gate(
    .a(a2),
    .b(b2),
    .out(out2)
);

initial
begin
    #0
    a2 = 0;
    b2 = 0;

    #4
    a2 = 0;
    b2 = 1;

    #4
    a2 = 1;
    b2 = 0;

    #4
    a2 = 1;
    b2 = 1;

    #4 $finish;
end
endmodule