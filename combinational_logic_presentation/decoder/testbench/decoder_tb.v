/*
module testbench();

reg a;

wire [1:0] y;

decoder_1X2 inst_decoder(
    .a(a),
    .y(y)
);

initial
begin
    a = 0;

    #10;
    a = 1;

    #10;
    $stop;

end

endmodule
*/

/*
module testbench();

reg a;
reg e;

wire [1:0] y;

decoder_1X2_E inst_decoder(
    .a(a),
    .e(e),
    .y(y)
);

initial
begin
    a = 0;
    e = 0;

    #10;
    a = 1;
    e = 0;

    #10;
    a = 0;
    e = 1;

    #10;
    a = 1;
    e = 1;

    #10;
    $stop;

end

endmodule
*/

module testbench();

reg a;
reg b;

wire [3:0] y;

decoder_2X4 inst_decoder(
    .a(a),
    .b(b),
    .y(y)
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