// edge trigger D flip flop
module D_ff(D, CP, n_rst, Q, Qbar);

// input, output declartion part
input D, CP, n_rst;
output reg Q, Qbar;

// module setting
always @ (posedge CP or negedge n_rst) begin
    if (n_rst == 0) begin
        Q <= 0;
        Qbar <= 0;
    end

    else begin
        if (D == 1'b0) begin
            Q <= 1'b0;
            Qbar <= 1'b1;
        end

        else if (D == 1'b1) begin
            Q <= 1'b1;
            Qbar <= 1'b0;
        end
    end
end
endmodule