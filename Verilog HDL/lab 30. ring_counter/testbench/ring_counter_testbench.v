module testbench();
    reg clk;
    reg rst;
    wire [3:0] counter_output;

    ring_counter_4bit inst_ring_counter_4bit (
        .clk(clk),
        .rst(rst),
        .counter_output(counter_output)
    );

    always begin
        #4 clk = ~clk;
    end

    initial begin
        clk = 0;
        rst = 0;

        @(posedge clk) begin
            rst <= 1;
        end

        repeat (10) begin
            @(posedge clk) begin
            end
        end

        @(posedge clk) begin
            $stop;
        end
    end

endmodule
