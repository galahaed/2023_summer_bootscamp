module testbench();

reg a;
reg b;

wire s;
wire c;

half_adder inst_half_adder(
    .a(a),
    .b(b),
    .s(s),
    .c(c)
);

initial 
begin
    a = 0; b = 0;

    #10;
    a = 0; b = 1;

    #10;
    a = 1; b = 0;

    #10;
    a = 1; b = 1;

    #10;
    $stop;
    
end

endmodule