module testbench();

reg [7:0] a;

wire p;
/*
parity_check_even inst_parity_even(
    .a(a),
    .p(p)
);
*/

parity_check_odd inst_parity_odd(
    .a(a),
    .p(p)
);

initial begin
    a = 8'b01010111;

    #10;
    a = 8'b10001110;

    #10;
    $stop;
    
end

endmodule