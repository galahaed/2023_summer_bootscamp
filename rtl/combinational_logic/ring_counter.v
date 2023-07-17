module ring_counter_4bit(
    clk,
    rst,
    counter_output
);

input clk;
input rst;
output [3:0] counter_output;

reg [3:0] counter;


always @ (posedge clk or negedge rst) begin
    if (!rst) begin
        counter <= 4'b0001;
    end 
    
    else begin
        counter <= {counter[0], counter[3:1]};
    end
end    

assign counter_output = counter;

endmodule