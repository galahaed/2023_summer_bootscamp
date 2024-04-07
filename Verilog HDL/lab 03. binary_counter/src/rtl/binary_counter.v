// 3-bit binary counter 
module binary_counter (
    clk,
    n_rst,
    x,
    out
);

input clk;
input n_rst;
input x;
output reg [2:0] out;

always @(posedge clk or negedge n_rst) begin
    if (!n_rst) begin
        out <= 3'b000;
    end else if (x) begin
        out <= out + 3'b001;
    end else if (!x) begin
        out <= out - 3'b001;
    end
end

endmodule
