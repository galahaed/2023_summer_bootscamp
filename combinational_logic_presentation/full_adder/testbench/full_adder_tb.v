module testbench();

reg a;
reg b;
reg c_in;

wire s;
wire c_out;

full_adder inst_full_adder(
    .a(a),
    .b(b),
    .c_in(c_in),
    .c_out(c_out),
    .s(s)
);

initial 
begin
    a = 0; b = 0; c_in = 0;

    #10;
    a = 0; b = 0; c_in = 1;

    #10;
    a = 0; b = 1; c_in = 0;

    #10;
    a = 0; b = 1; c_in = 1;

    #10;
    a = 1; b = 0; c_in = 0;

    #10;
    a = 1; b = 0; c_in = 1;

    #10;
    a = 1; b = 1; c_in = 0;

    #10;
    a = 1; b = 1; c_in = 1;

    #10;
    $stop;

end


endmodule