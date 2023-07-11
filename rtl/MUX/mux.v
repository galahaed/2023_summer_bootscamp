/*
// 8 X 1 MUX
module mux(
    s0,
    s1,
    s2,
    d0,
    d1,
    d2,
    d3,
    d4,
    d5,
    d6,
    d7,
    out
);

// input, output part
input s0;
input s1;
input s2;

input d0;
input d1;
input d2;
input d3;
input d4;
input d5;
input d6;
input d7;

output out;

// asignment part
assign out = ((~s2 & ~s1 & ~s0) & d0) | ((~s2 & ~s1 & s0) & d1) | ((~s2 & s1 & ~s0) & d2) | ((~s2 & s1 & s0) & d3) | ((s2 & ~s1 & ~s0) & d4) | ((s2 & ~s1 & s0) & d5) | ((s2 & s1 & ~s0) & d6) | ((s2 & s1 & s0) & d7);

endmodule
*/

// 8 X 1 MUX
module mux(
    s0,
    s1,
    s2,
    d0,
    d1,
    d2,
    d3,
    d4,
    d5,
    d6,
    d7,
    out
);

// input, output part
input s0;
input s1;
input s2;

input d0;
input d1;
input d2;
input d3;
input d4;
input d5;
input d6;
input d7;

output out;

// asignment part
assign out = s2 ? (s1 ? (s0 ? d7 : d6) : (s0 ? d5 : d4)) : (s1 ? (s0 ? d3 : d2) : (s0 ? d1 : d0));

endmodule