module testbench();

reg [3:0] b;

wire [3:0] g;

code_converter_bg inst_converter_bg(
    .b(b),
    .g(g)
);


initial begin
    b = 4'b1001;
    
    #10;
    b = 4'b0011;

    #10;
    $stop;

end

endmodule