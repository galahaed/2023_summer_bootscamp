module testbench();

// register, wire declartion part
reg J, K, CP, n_rst;
wire Q, Qbar;

// instance declartion part
JK_ff inst_JK_ff(
    .CP(CP),
    .n_rst(n_rst),
    .J(J),
    .K(K),
    .Q(Q),
    .Qbar(Qbar)
);

always 
begin
#2;
CP = ~CP;
end
// 모델심의 J or S와 K or R이 각각 0, 0일 때 don't care상태가 지속됨
// 내일 물어볼 것. 0, 0일때 값을 reset시키는 법.
initial 
begin
    CP = 0;
    n_rst = 0;
    
    #0;
    J = 0;
    K = 0;

    #2; 
    n_rst = 1;
    J = 0;
    K = 0;

    #2;
    J = 0;
    K = 1;

    #2;
    J = 0;
    K = 1;

    #2;
    J = 1;
    K = 0;

    #2;
    J = 1;
    K = 0;

    #2;
    J = 1;
    K = 1;

    #2;
    J = 1;
    K = 1;

    #2; 
    $stop;
end
endmodule