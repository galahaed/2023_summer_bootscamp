module testbench();

reg s;
reg r;

wire q;
wire q_bar;

sr_nor_latch inst_sr_nor(
    .s(s),
    .r(r),
    .q(q),
    .q_bar(q_bar)
);

initial
begin
    s = 0;
    r = 0;

    #10;
    s = 0;
    r = 1;
    
    #10;
    s = 1;
    r = 0;

    #10;
    s = 1;
    r = 1;

    #10;
    $stop;
end
endmodule