// 1bit moore machine.
module moore_machine (clk, rst, x, y);
    input clk;
    input rst;
    input x;

    output reg y;

    reg c_state;  // now state
    reg n_state;  // next state

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            c_state <= 1'b0;
        end

        else begin
            c_state <= n_state;
        end
    end


    always @(c_state, x) begin
        y = c_state;
        case (c_state)  // case : now state 
            1'b0:   // c_state = 0
                if (x) begin // x = 1
                    n_state = 1'b1;
                end

                else  begin // x = 0
                    n_state = 1'b0;
                end

            1'b1:   // c_state = 1
                if (x) begin // x = 1
                    n_state = 1'b0;
                end

                else begin // x = 0
                    n_state = 1'b1;
                end

            default: begin  // 실패시 next state = 0, y = 0
                n_state = 1'b0;
            end

        endcase
    end
endmodule

/*
    always @(c_state) begin
        y = c_state;  // 조합논리회로가 플립플롭에 값이 할당 될 때마다 y에도 값이 지속적으로 할당.
    end

endmodule

/*
     always @(*) begin
        case (c_state)  // case : now state 
            1'b0:  // c_state = 0
                if (~x) begin // x = 0
                    n_state = 1'b0;
                    y = 1'b0;
                end

                else  begin // x = 1
                    n_state = 1'b1;
                    y = 1'b0;
            end
            
            1'b1:  // c_state = 1
                if (~x) begin // x = 0
                    n_state = 1'b1;
                    y = 1'b1;
                end

                else  begin // x = 1
                    n_state = 1'b0;
                    y = 1'b1;
                end

            default: begin  // 실패시 next state = 0
                n_state = 1'b0;
                y = 1'b0;
            end

        endcase
    end
*/
    

