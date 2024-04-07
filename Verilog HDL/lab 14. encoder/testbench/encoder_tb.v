
module testbench();

reg [1:0] a;

wire out;

encoder_2X1 inst_encoder(
    .a(a),
    .out(out)
);

initial begin
    a = 2'b00;

    #10;
    a = 2'b01;

    #10;
    a = 2'b10;

    #10;
    $stop;
    
end

endmodule


/*
module testbench();

reg [3:0] a;

wire [1:0] out;

encoder_4X2 inst_encoder(
    .a(a),
    .out(out)
);

initial begin
    a = 4'b0000;

    #10;
    a = 4'b0001;

    #10;
    a = 4'b0010;

    #10;
    a = 4'b0100;

    #10;
    a = 4'b1000;

    #10;
    $stop;
    
end

endmodule
*/
