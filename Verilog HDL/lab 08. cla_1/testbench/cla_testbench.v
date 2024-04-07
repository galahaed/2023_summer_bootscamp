module testbench;

    reg [3:0] a;
    reg [3:0] b;
    
    wire [3:0] sum;
    wire c_out;
    
    cla inst_cla(
        .a(a), 
        .b(b), 
        .sum(sum), 
        .c_out(c_out));
    
    initial begin
        // Test case 1: a = 7 (0111), b = 5 (0101)
        a = 4'b0111;
        b = 4'b0101;
        #10; 
        
        // Test case 2: a = 9 (1001), b = 2 (0010)
        a = 4'b1001;
        b = 4'b0010;
        #10; 
        
       
        
        $stop; 
    end
    
endmodule
