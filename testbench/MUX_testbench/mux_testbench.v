module testbench();

// register, wire part
reg s0, s1, s2;
reg d0, d1, d2, d3, d4, d5, d6, d7;

wire out;

// instance part
mux inst_mux(
    .s0(s0),
    .s1(s1),
    .s2(s2),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .d4(d4),
    .d5(d5),
    .d6(d6),
    .d7(d7),
    .out(out)
);

// main code part
initial
begin
    #0;
    s2 = 0;
    s1 = 0;
    s0 = 0;

    d0 = 0;
    #2;
    d0 = 1;
    
    #4;
    s2 = 0;
    s1 = 0;
    s0 = 1;

    d1 = 0;
    #2;
    d1 = 1;

    #4;
    s2 = 0;
    s1 = 1;
    s0 = 0;

    d2 = 0;
    #2;
    d2 = 1;

    #4;
    s2 = 0;
    s1 = 1;
    s0 = 1;

    d3 = 0;
    #2;
    d3 = 1;

    #4;
    s2 = 1;
    s1 = 0;
    s0 = 0;

    d4 = 0;
    #2;
    d4 = 1;

    #4;
    s2 = 1;
    s1 = 0;
    s0 = 1;

    d5 = 0;
    #2;
    d5 = 1;

    #4;
    s2 = 1;
    s1 = 1;
    s0 = 0;

    d6 = 0;
    #2;
    d6 = 1;

    #4;
    s2 = 1;
    s1 = 1;
    s0 = 1;

    d7 = 0;
    #2;
    d7 = 1;

    #4; $stop;
end
endmodule