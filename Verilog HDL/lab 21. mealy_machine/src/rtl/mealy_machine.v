module mealy_machine (clk, rst, x, y);

input clk;
input rst;

input x;

output reg y;

reg c_state;
reg n_state;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        c_state <= 1'b0;
    end

    else begin
        c_state <= n_state;
    end
end

always @(c_state, x) begin
    case (c_state)  // case : now state 
        1'b0: begin  // c_state = 0
            if (x) begin // x = 1
                n_state = 1'b1;
                y = 1'b0;
            end

            else begin // x = 0
                n_state = 1'b0;
                y = 1'b0;
            end
        end

        1'b1: begin  // c_state = 1
            if (x) begin // x = 1
                n_state = 1'b1;
                y = 1'b1;
            end

            else begin // x = 0
                n_state = 1'b0;
                y = 1'b0;
            end
        end

        default: begin  // 실패시 next state = 0
            n_state = 1'b0;
            y = 1'b0;
        end

    endcase
end

endmodule