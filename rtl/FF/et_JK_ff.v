// edge trigger JK flip flop
module JK_ff(J, K, CP, n_rst, Q, Qbar);

input J, K, CP, n_rst;
output reg Q, Qbar;

always @ (posedge CP or negedge n_rst) begin
    if (n_rst == 0) begin
        Q <= 0;
        Qbar <= 0;
    end
    
    else begin
        if (~J && K) begin
            Q <= 0;
            Qbar <= 1;
        end 

        else if (J && ~K) begin 
            Q <= 1;
            Qbar <= 0;
        end

        else if (J && K) begin
            Q <= ~Q;
            Qbar <= ~Qbar;
        end
    end
end
endmodule