module testbench();

reg a;
reg b;

wire f1;
wire f2;
wire f3;
wire f4;

comparator_1bit inst_comparator(
    .a(a),
    .b(b),
    .f1(f1),
    .f2(f2),
    .f3(f3),
    .f4(f4)
);

initial
begin
    a = 1'b0;
    b = 1'b0;

    #10;
    a = 1'b0;
    b = 1'b1;

    #10;
    a = 1'b1;
    b = 1'b0;

    #10;
    a = 1'b1;
    b = 1'b1;

    #10;
    $stop;
    
end


endmodule