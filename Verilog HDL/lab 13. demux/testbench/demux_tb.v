module testbench();

reg e;
reg [1:0] s;

wire y0;
wire y1;
wire y2;
wire y3;

demux inst_demux(
    .e(e),
    .s(s),
    .y0(y0),
    .y1(y1),
    .y2(y2),
    .y3(y3)
);

initial
begin
    e = 1'b1;
    s = 2'b00;

    #10;
    s = 2'b01;

    #10;
    s = 2'b10;

    #10; 
    s = 2'b11;

    #10;
    $stop;

end

endmodule