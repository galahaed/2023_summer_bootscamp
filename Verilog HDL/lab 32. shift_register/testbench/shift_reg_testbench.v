module testbench();

// declartion of registeres and wire part.
reg clk;
reg rst;
reg shift_left;
reg shift_right;

wire [3:0] out;

// declartion of instance part.
shift_register_4bit inst_shift_register_4bit(
    .clk(clk),
    .rst(rst),
    .shift_left(shift_left),
    .shift_right(shift_right),
    .out(out)
);

// declartion clk toggle part.
always begin
    #5;
    clk = ~clk;
end

// main initial code part.
initial     
begin
    #0;
    clk = 0;
    rst = 0;
    shift_left = 0;
    shift_right = 0;
    
    #5;
    rst <= 1; 
    
    @ (posedge clk) begin
        #5;
        shift_left = 1;
    end

    @ (posedge clk) begin
        #5;
        shift_right = 1;
        shift_left = 0;
    end


    @ (posedge clk) begin   
        #10
        $stop;
    end
end

endmodule