module testbench();

reg a;
reg b;
wire out;

or_gate u_or_gate(
    .a(a),
    .b(b),
    .out(out)
);

initial begin
    #0
    a = 1'b0;
    b = 1'b0;
    // out == 0

    #4
    a = 1'b0;
    b = 1'b1;
    // out == 1

    #4
    a = 1'b1;
    b = 1'b0;
    // out == 1

    #4
    a = 1'b1;
    b = 1'b1;
    // out == 1
end

endmodule
