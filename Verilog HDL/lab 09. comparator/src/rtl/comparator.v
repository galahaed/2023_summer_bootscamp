
module comparator_1bit(a, b, f1, f2, f3, f4);

input a;
input b;

output reg f1;
output reg f2;
output reg f3;
output reg f4;

always @(*) begin
    if (a == b) begin
        f1 = ~(a ^ b);
        f2 = 1'b0;
        f3 = 1'b0;
        f4 = 1'b0;
    end

    else begin
        if (a > b) begin
        f1 = 1'b0;
        f2 = a ^ b;
        f3 = a & (~b);
        f4 = 1'b0;
        end

        else if (a < b) begin
        f1 = 1'b0;
        f2 = a ^ b;
        f3 = 1'b0;
        f4 = (~a) & b;
        end
    end

end

endmodule
