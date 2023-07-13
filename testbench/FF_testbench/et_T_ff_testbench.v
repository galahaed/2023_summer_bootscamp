module testbench();

// register and wire declartion part 
reg T, CP, n_rst;
wire Q, Qbar;

// instantce declartion part
T_ff inst_T_ff(
    .T(T),
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
    CP = 0;
    n_rst = 0;
    T = 0;

    #0;
    T = 0;

    #2;
    T = 0;
    n_rst = 1;
    
    #2;
    T = 1;

    #2;
    T = 1;
    
    #2;
    T = 0;

    #2;
    T = 0;

    #2;
    T = 1;

    #2;
    T = 1;

    #2;
    $stop;

end
endmodule