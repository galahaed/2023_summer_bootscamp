/*
module mux(d, s, f);

input [1:0] d;
input s; // select

output reg f;

always @(*) begin
    if(d) begin
        case(s)
            1'b0 : f = d[0];
            1'b1 : f = d[1];

            default : 
                f = 1'b0;
        
        endcase
    end

    else begin
        f = 1'b0;
    end
end


endmodule
*/

module mux(d, s, f);

input [3:0] d;
input [1:0] s;

output reg f;  // 4bit 중 1bit만 출력

always @(*) begin
    if(d) begin
        case(s)
            2'b00 : f = d[0];
            2'b01 : f = d[1];
            2'b10 : f = d[2];
            2'b11 : f = d[3];

            default : 
                f = 1'b0;
        
        endcase
    end

    else begin
        f = 1'b0;
    end
end


endmodule