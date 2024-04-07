
// 2bit Moore Machine
module moore_machine(
    input clk,
    input n_rst,
    input x,
    output reg y      
);

reg [1:0] n_state;  // next state
reg [1:0] c_state;  // now state

always @(posedge clk or negedge n_rst) begin
    if (!n_rst) begin
        c_state <= 2'b0;
        y <= 1'b0;
    end

    else begin  // n_rst == 1
        c_state <= n_state;
        // y <= c_state;
    end
end

always @(x) begin
    y = n_state;
    case (n_state) 
        // x값에 따라 ? x = 0 일 때, 다음 상태 : x = 1 일 때, 다음 상태
        2'b00 : begin
            if (!x) begin
                n_state = 2'b01;
            end

            else begin
                n_state = 2'b00;
            end
        end

        2'b01 : begin
            if (!x) begin
                n_state = 2'b01;
            end

            else begin
                n_state = 2'b10;
            end
        end

        2'b10 : begin
            if (!x) begin
                n_state = 2'b10;
            end

            else begin
                n_state = 2'b11;
            end
        end

        2'b11 : begin
            if (!x) begin
                n_state = 2'b11;
            end

            else begin
                n_state = 2'b00;
            end
        end

        default : n_state = 2'b00;
    endcase
end

endmodule



/*
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
*/