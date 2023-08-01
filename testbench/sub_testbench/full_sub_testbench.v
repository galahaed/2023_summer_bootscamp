module testbench();

reg a;
reg b;
reg br_0;

wire out;
wire br;

full_sub inst_full_sub(
    .a(a),
    .b(b),
    .out(out),
    .br(br),
    .br_0(br_0)
);

initial 
begin
    a = 0;
    b = 0;
    br_0 = 0;

    #10;
    a = 0;
    b = 0;
    br_0 = 1;

    #10;
    a = 0;
    b = 1;
    br_0 = 0;

    #10;
    a = 0;
    b = 1;
    br_0 = 1;

    #10;
    a = 1;
    b = 0;
    br_0 = 0;

    #10;
    a = 1;
    b = 0;
    br_0 = 1;

    #10;
    a = 1;
    b = 1;
    br_0 = 0;

    #10;
    a = 1;
    b = 1;
    br_0 = 1;

    #10;
    $stop;

end

endmodule