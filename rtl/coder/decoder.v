// 2 X 4 decoder
module decoder(
    a,
    b,
    y0,
    y1,
    y2,
    y3
);

// input, output part
input a;
input b;

output y0;
output y1;
output y2;
output y3;

// assignment part
assign y0 = ~a & ~b;
assign y1 = a & ~b;
assign y2 = ~a & b;
assign y3 = a & b;


endmodule