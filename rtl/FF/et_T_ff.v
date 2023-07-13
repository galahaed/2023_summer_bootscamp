// edge trigger T flip flop
module T_ff (T, CP, Q, Qbar, n_rst);

// input, output declartion part
input T, CP, n_rst;
output reg Q, Qbar;

//
always @ (posedge CP or negedge n_rst) begin
    if(!n_rst) begin
        Q <= 0;
        Qbar <= 0;
    end
    else begin
        if (T == 0) begin
        // not toggling 
    end
    else if (T == 1) begin
        Q <= ~Q; 
        Qbar <= ~Qbar; 
    end 
end
end
endmodule 