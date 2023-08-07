
module encoder_2X1(a, out);

input [1:0] a;

output reg out;

always @(*) begin
    out = 1'b0;

    case(a)
        2'b01 : out = 0; 
        2'b10 : out = 1;

        default : begin
            out = 2'b00;
        end

    endcase

end

endmodule


/*
module encoder_4X2(a, out);

input [3:0] a;

output reg [1:0] out;

always @(*) begin
    out = 2'b00;

    case(a)
        4'b0001 : out = 2'b00; // a = 4'b0001, out = 2'b00
        4'b0010 : out = 2'b01; // a = 4'b0010, out = 2'b01
        4'b0100 : out = 2'b10; // a = 4'b0100, out = 2'b10
        4'b1000 : out = 2'b11; // a = 4'b1000, out = 2'b11

        default : begin
            out = 2'b00;
        end

    endcase

end

endmodule
*/