module testbench();

reg a2, b2;
wire out;

xor_gate ins_xor_gate(
    .a(a2),
    .b(b2),
    .F(out)
);

initial
begin
    #0;
    a2 = 0;
    b2 = 0;

    #4;
    a2 = 0;
    b2 = 1;

    #4;
    a2 = 1;
    b2 = 0;

    #4;
    a2 = 1;
    b2 = 1;

    #4 $stop;

end

endmodule