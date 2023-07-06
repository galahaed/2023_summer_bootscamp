module testbench();

reg a;
wire out;

not_gate u_not_gate(
    .a(a),
    .out(out)
);

initial begin
    a = 1'h0;

    #5
    a = 1;

    #5
    a = 0;

    #5
    a = 1;

    #5
    $stop;
end

endmodule