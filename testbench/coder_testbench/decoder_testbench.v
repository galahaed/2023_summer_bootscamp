module testbench();

// register, wire part
reg a;
reg b;

wire y0;
wire y1;
wire y2;
wire y3;

// instance part
decoder inst_decoder(
    .a(a),
    .b(b),
    .y0(y0),
    .y1(y1),
    .y2(y2),
    .y3(y3)
);

// main code part
initial
begin
    #0;
    a = 0; b = 0;

    #4;
    a = 1; b = 0;

    #4;
    a = 0; b = 1;
    
    #4;
    a = 1; b = 1;

    #4; $stop;
    
end
endmodule