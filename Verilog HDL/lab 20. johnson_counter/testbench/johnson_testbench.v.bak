module testbench;

// register, wire
reg clk;
reg rst;

wire [3:0] out;

// instance 
johnson_counter inst_johnson(
    .clk(clk),
    .rst(rst),

    .out(out)
);

always #10 clk = ~clk;

initial 
begin 
    #0;
    clk = 0;
    rst = 0;
    
    repeat(30) begin
        #10;
        rst = 1;
    end
    
    #10;
    $stop;
    
end

endmodule