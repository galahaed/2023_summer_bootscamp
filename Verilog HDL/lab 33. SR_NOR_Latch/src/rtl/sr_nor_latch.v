module sr_nor_latch(s, r, q, q_bar);

input s;
input r;

output q;
output q_bar;

reg w_q;
reg w_q_bar;

always @(*) begin
    w_q_bar = ~(s | w_q);
    w_q = ~(r | w_q_bar);
end

assign q = w_q;
assign q_bar = w_q_bar;

endmodule