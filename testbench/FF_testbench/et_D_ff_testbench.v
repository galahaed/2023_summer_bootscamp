module testbench();

reg D, CP, n_rst;
wire Q, Qbar;

D_ff inst_D_ff(
    .D(D),
    .CP(CP),
    .n_rst(n_rst),
    .Q(Q),
    .Qbar(Qbar)
);

always begin
    #2;
    CP = ~CP;
end

initial begin
    #0;
    n_rst = 0;
    CP = 0;
    D = 0;

    #2;
    D = 0;

    #2;
    n_rst = 1;
    D = 1;

    #2;
    D = 1;

    #2;
    D = 0;

    #2;
    D = 0;

    #2; 
    D = 1;

    #2;
    D = 1;
    
    #2;
    $stop;
end
endmodule