module testbench();

reg [3:0] d;
reg [1:0] s;

wire f;

mux inst_mux(
    .d(d),
    .s(s),
    .f(f)
);

/*
initial 
begin
    d = 2'b10;
    s = 0;

    #10;
    s = 0;

    #10;
    s = 1;
    
    #10;
    $stop;

end
*/

initial 
begin
    d = 4'b1010;
    s = 00;

    #10;
    s = 01;

    #10;
    s = 10;

    #10;
    s = 11;
    
    #10;
    $stop;

end

endmodule