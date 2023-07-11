module testbench();

// register, wire part
reg d0;
reg d1;
reg d2; 
reg d3;

wire b0;
wire b1;

// instance part
encoder inst_encoder(
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .b0(b0),
    .b1(b1)
);

// main code part
initial
begin
    #0;
    d3 = 1'b0;
    d2 = 1'b0;
    d1 = 1'b0;
    d0 = 1'b1;

    #4;
    d3 = 1'b0;
    d2 = 1'b0;
    d1 = 1'b1;
    d0 = 1'b0;

    #4;
    d3 = 1'b0;
    d2 = 1'b1;
    d1 = 1'b0;
    d0 = 1'b0;
    
    #4;
    d3 = 1'b1;
    d2 = 1'b0;
    d1 = 1'b0;
    d0 = 1'b0;

    #4; $stop;
    
end
endmodule