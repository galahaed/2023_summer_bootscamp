module testbench();

reg a;
reg b;

wire out;
wire br;

half_sub inst_half_sub(
    .a(a),
    .b(b),
    .out(out),
    .br(br)
);

initial 
begin
    a = 0;
    b = 0;

    #10;
    a = 0;
    b = 1;

    #10;
    a = 1;
    b = 0;

    #10;
    a = 1;
    b = 1;

    #10;
    $stop;

end

endmodule