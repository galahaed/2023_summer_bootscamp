module testbench();

reg [3:0] in;
reg [1:0] select;

wire out;

mux inst_mux(
    .in(in),
    .select(select),
    .out(out)
);

initial begin
    #0;
    select = 2'b00;
    in = 4'b0000;

    #5;
    select = 2'b00;
    in = 4'b0001;

    #5;
    select = 2'b01;
    in = 4'b0010;

    #5;
    select = 2'b10;
    in = 4'b0100;
    
    #5;
    select = 2'b11;
    in = 4'b1000;

    #5;  //failed simulation
    select = 2'b10;
    in = 4'b0000;

    #5;
    $stop;
    

end
endmodule