module testbench();

reg [3:0] g;

wire [3:0] b;

code_converter_gb inst_con_gb(
    .g(g),
    .b(b)
);

initial begin
    g = 4'b1100;

    #10;
    g = 4'b0101;

    #10;
    g = 4'b1001;

    #10;
    $stop;

end

endmodule