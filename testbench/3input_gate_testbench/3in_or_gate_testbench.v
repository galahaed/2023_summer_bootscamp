module testbench();

reg a, b, c;
wire out;

or_gate_3input ins_or_gate_3(
    .a(a),
    .b(b),
    .c(c),
    .F(out)
);

initial 
begin
    #0;
    a = 0; b = 0; c = 0;

    #4;
    a = 0; b = 0; c = 1;
    
    #4;
    a = 0; b = 1; c = 0;
    
    #4;
    a = 0; b = 1; c = 1;

    #4;
    a = 1; b = 0; c = 0;

    #4;
    a = 1; b = 0; c = 1;

    #4;
    a = 1; b = 1; c = 0;

    #4;
    a = 1; b = 1; c = 1;

    #4 $stop;

end
endmodule