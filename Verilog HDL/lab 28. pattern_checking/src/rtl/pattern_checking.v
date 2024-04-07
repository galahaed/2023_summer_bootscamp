module pattern_checking(clk, n_rst, x, y);

input clk;
input n_rst;

input x;

output reg y; 

reg [1:0] c_state; // now state
reg [1:0] n_state; // next state

always @(posedge clk or negedge n_rst) begin
    if(!n_rst) begin
        n_state <= 2'b00;
        y <= 1'b0;
    end

    else begin 
        c_state <= n_state;
        y <= x;
    end
end

always @(*) begin
    case(c_state)
        2'b00 : begin
            if (~x) begin // x = 0
                n_state = 2'b00;
                y = 1'b1;
            end

            else begin // x = 1
                n_state = 2'b01;
                y = 1'b0;
            end
        end

        2'b01 : begin
            if (~x) begin // x = 0
                n_state = 2'b00;
                y = 1'b0;
            end

            else begin // x = 1
                n_state = 2'b01;
                y = 1'b1;
            end
        end

        2'b10 : begin
            if (~x) begin // x = 0
                n_state = 2'b11;
                y = 1'b0;
            end

            else begin // x = 1
                n_state = 2'b00;
                y = 1'b1;
            end
        end

        2'b11 : begin
            if (~x) begin // x = 0
                n_state = 2'b11;
                y = 1'b1;
            end

            else begin // x = 1
                n_state = 2'b00;
                y = 1'b0;
            end
        end

        default : begin
            n_state = 2'b00;
            y = 1'b0;
        end
        
    endcase
end

endmodule