
// 2bit Mealy Machine
module mealy_machine_2bit(
    input clk,
    input rst,
    input x,
    output reg y
);

reg [1:0] n_state; // next_state
reg [1:0] c_state; // now_state

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        c_state <= 2'b0;
    end

    else begin // rst == 1
        c_state <= n_state;
    end
end

always @(x, c_state) begin
    case(c_state)
        2'b00 : begin
            y = x ? 1'b0 : 1'b1; // x = 1 -> y = 0, x = 0 -> y = 1
            n_state = y ? 2'b00 : 2'b01; // y = 1 -> n_state = 2'b00, y = 0 -> n_state = 2'b01
        end

        2'b01 : begin
            y = x ? 1'b1 : 1'b0; // x = 1 -> y = 1, x = 0, y = 0
            n_state = y ? 2'b11 : 2'b01; // y = 1 -> n_state = 2'b11, y = 0 -> n_state = 2'b01
        end

        2'b11 : begin
            y = x ? 1'b1 : 1'b0; // x = 1 -> y = 1, x = 0, y = 0
            n_state = y ? 2'b00 : 2'b11; // y = 1 -> n_state = 2'b00, y = 0 -> n_state = 2'b11
        end

        default : begin
            y = 1'b0;
            n_state = 2'b00;
        end
    endcase
end

/*
always @(x, c_state) begin
    case(c_state)
        2'b00 : begin
            if (x) begin
                y = 0;
                n_state = 2'b01;
            end
            
            else begin 
                y = 1;
                n_state = 2'b00;
            end
        end

        2'b01 : begin
            if (x) begin
                y = 1;
                n_state = 2'b11;
            end
            
            else begin
                y = 0;
                n_state = 2'b01;
            end
        end

        2'b11 : begin
            if (x) begin
                y = 1;
                n_state = 2'b00;
            end

            else begin
                y = 0;
                n_state = 2'b11;
            end
        end

        default : begin
            y = 0;
            n_state = 2'b00;
        end
    endcase
end
*/
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