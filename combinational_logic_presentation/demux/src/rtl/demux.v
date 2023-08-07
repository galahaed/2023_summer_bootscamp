module demux(e, s, /*y*/ y0, y1, y2, y3);

input e;
input [1:0] s; // select

// output reg [3:0] y;
// 그래프 가독성이 편리하도록 y0~3까지 (4bit output y) 생성
output reg y0;
output reg y1;
output reg y2;
output reg y3;

always @(*) begin
    y0 = 1'b0;
    y1 = 1'b0;
    y2 = 1'b0;
    y3 = 1'b0;
    
    // y = 4'b0000;

    case(s)
        2'b00 : y0 = e;
        2'b01 : y1 = e;
        2'b10 : y2 = e;
        2'b11 : y3 = e;

    endcase

    /*
    case(s)
        2'b00 : y = e;
        2'b01 : y = e;
        2'b10 : y = e;
        2'b11 : y = e;

    endcase
    */
end

endmodule