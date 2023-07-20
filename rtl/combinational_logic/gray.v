module gray_counter(clk, rst, b_num, out);

input clk;
input rst;
input [2:0] b_num;

output reg [2:0] out;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        out <= 3'b000; 
    end
    else begin
        out[2] <= b_num[2];
        out[1] <= b_num[2] ^ b_num[1];
        out[0] <= b_num[1] ^ b_num[0];

    end
end

endmodule


/*
// 2-bit gray counter code
module gray_counter(clk, rst, b_num, out);

input clk;
input rst;
input [2:0] b_num;

output reg [2:0] out;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        out <= 3'b000; 
    end

    else begin
        for (b_num = 3'b000; b_num <= 3'b111; b_num = b_num + 3'b001) begin
            out[2] <= b_num[2];
            if (b_num[2] != b_num[1]) begin
                out[1] <= 1'b1;
                
                if (b_num[1] != b_num[0]) begin
                    out[0] <= 1'b1;
                end

                else if (b_num[1] == b_num[0]) begin
                    out[0] <= 1'b0;
                end
            end

            else if (b_num[2] == b_num[1]) begin
                out[1] <= 1'b0;

                if (b_num[1] != b_num[0]) begin
                    out[0] <= 1'b1;
                end

                else if (b_num[1] == b_num[0]) begin
                    out[0] <= 1'b0;
                end
            end
        end
    end
    
end

endmodule
*/
