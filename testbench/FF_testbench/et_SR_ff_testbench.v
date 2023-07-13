module testbench();

// register, wire declartion part
reg s, r, cp, rst;
wire q, qbar;

// instance declartion part
SR_ff inst_SR_ff(
    .s(s),
    .r(r),
    .cp(cp),
    .rst(rst),
    .q(q),
    .qbar(qbar)
);

always 
begin
#2;
cp = ~cp;
end

initial 
begin
    cp = 0;
    rst = 0;

    #0;
    s = 0;
    r = 0;

    #2; 
    rst = 1;
    s = 0;
    r = 0;

    #2;
    s = 0;
    r = 1;

    #2;
    s = 0;
    r = 1;

    #2;
    s = 1;
    r = 0;

    #2;
    s = 1;
    r = 0;

    #2;
    s = 1;
    r = 1;

    #2;
    s = 1;
    r = 1;

    #2; 
    $stop;
end
endmodule