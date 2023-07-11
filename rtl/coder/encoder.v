// 4 X 2 encoder
module encoder(
    d0,
    d1,
    d2,
    d3,
    b1,
    b0
);

// input, output part
input d0;
input d1;
input d2;
input d3;

output b0;
output b1;

// assignment part
assign b1 = d2 | d3;
assign b0 = d1 | d3;

endmodule