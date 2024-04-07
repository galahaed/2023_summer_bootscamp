/*
module decoder_1X2(a, y);

input a;

output reg [1:0] y;

always @(*) begin
    if (~a) begin
        y[0] = 1'b1;
        y[1] = 1'b0;

        // y = 2'b01;
    end
    
    else begin // if (a)
        y[0] = 1'b0;
        y[1] = 1'b1;
        
        // y = 2'b10;
    end
end

endmodule
*/

/*
module decoder_1X2_E(a, e, y);

input a;
input e; // enable

output reg [1:0] y;

always @(*) begin
    if (~e) begin
        y[0] = 1'b0;
        y[1] = 1'b0;

        // y = 2'b00;
    end
    
    else begin // if (e)
        if (~a) begin
            y[0] = 1'b1;
            y[1] = 1'b0;

            // y = 2'b01;
        end

        else begin // if (a)
            y[0] = 1'b0;
            y[1] = 1'b1;
        end
        
        // y = 2'b10;
    end
end

endmodule
*/


module decoder_2X4(a, b, y);

input a;
input b;

output reg [3:0] y;

always @(*) begin
    y = 4'b0000;  

    case ({a, b})
        2'b00 : y[0] = 1'b1;  // a = 0, b = 0, y = 4'b0001
        2'b01 : y[2] = 1'b1;  // a = 0, b = 1, y = 4'b0100
        2'b10 : y[1] = 1'b1;  // a = 1, b = 0, y = 4'b0010
        2'b11 : y[3] = 1'b1;  // a = 1, b = 1, y = 4'b1000
    endcase
end

endmodule
