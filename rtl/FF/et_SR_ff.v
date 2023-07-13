// edge trigger SR flip flop
module SR_ff(
    s,
    r,
    cp,
    rst,
    q,
    qbar
); 

// input, output part
input s, r, cp, rst;
output reg q, qbar;


// condition part
always @ (posedge cp or negedge rst) begin
    if (rst == 0) begin
        q <= 0;
        qbar <= 0;
    end 
    else begin 
        if (~s && r) begin
            q <= 1'b0;
            qbar <= 1'b1;
        end

        else if (s && ~r) begin
            q <= 1'b1;
            qbar <= 1'b0;
        end

        else if (s && r) begin
            q <= ~q;
            qbar <= ~qbar;
        end
    end
end
endmodule