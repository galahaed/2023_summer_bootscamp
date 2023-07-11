module testbench();

// register, wire part
reg a;
reg b;
reg c_in;

wire s;
wire c_out;

// instance part 
full_adder inst_full_adder(
    .a(a),
    .b(b),
    .sum(s),
    .carry_in(c_in),
    .carry_out(c_out)
);

// main part
initial
begin
    #0;
    a = 0; b = 0; c_in = 0;

    #4;
    a = 0; b = 0; c_in = 1;

    #4;
    a = 0; b = 1; c_in = 0;

    #4;
    a = 0; b = 1; c_in = 1;

    #4;
    a = 1; b = 0; c_in = 0;

    #4;
    a = 1; b = 0; c_in = 1;

    #4;
    a = 1; b = 1; c_in = 0;

    #4;
    a = 1; b = 1; c_in = 1;

    #4; $stop;
end
endmodule