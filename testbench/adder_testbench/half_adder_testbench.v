module testbench();

// register, wire part
reg a;
reg b;
wire s;
wire c;

// instance part
half_adder inst_half_adder(
    .a(a),
    .b(b),
    .sum(s),
    .carry(c)
);

// main part 
initial
begin
    #0;
    a = 0; b = 0;

    #4;
    a = 0; b = 1;

    #4;
    a = 1; b = 0;

    #4;
    a = 1; b = 1;

    #4; $stop;
end
endmodule