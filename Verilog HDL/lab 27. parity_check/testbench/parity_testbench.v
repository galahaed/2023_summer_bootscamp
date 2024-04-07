
module testbench();

reg [7:0] a;

wire odd;
wire even;

parity inst_parity(

    .a(a),
    .odd(odd),
    .even(even)
);

initial 
begin
    #0;
    a = 8'b00000000;

    #5;
    a = 8'b00000001;

    #5;
    a = 8'b00000010;

    #5;
    a = 8'b00000011;

    #5;
    a = 8'b00000100;

    #5;
    a = 8'b00000101;

    #5;
    a = 8'b00000110;

    #5;
    a = 8'b00000111;

    #5;
    a = 8'b00001000;

    #5;
    $stop;

end

endmodule