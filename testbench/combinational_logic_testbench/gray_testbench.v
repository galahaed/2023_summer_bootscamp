module testbench();

reg clk;
reg rst;
reg [2:0] b_num;

wire [2:0] out;

gray_counter inst_gray_counter(
    .clk(clk),
    .rst(rst),
    .b_num(b_num),
    .out(out)
);

always begin
    #5;
    clk <= ~clk;
end

initial 
begin
    #0;
    clk = 0;
    rst = 0;
    b_num = 3'b000;
    
    @ (posedge clk) begin
        #10;
        rst = 1;
        b_num = 3'b000;

        #10; 
        b_num = 3'b001;

        #10;
        b_num = 3'b010;

        #10; 
        b_num = 3'b011;

        #10; 
        b_num = 3'b100;

        #10; 
        b_num = 3'b101;

        #10; 
        b_num = 3'b110;

        #10; 
        b_num = 3'b111;
    end
    
    #10;
    $stop;
end

endmodule
