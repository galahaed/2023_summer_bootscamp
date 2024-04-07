/*
module booth_multiplier(
    input clk,
    input n_rst,

    input [3:0] in1,
    input [3:0] in2,
    
    output [7:0] out
);

wire [8:0] ret;  // 9 bit temp storage ret.

reg [3:0] count;

wire [3:0] A;
wire [3:0] Q;
wire Q_1;
wire [3:0] M;


always @(posedge clk or negedge n_rst) begin
    if (!n_rst) begin
        out <= 8'b0;
        count <= 4'b0;
        A <= 4'b0;
        Q <= 4'b0;
        Q_1 <= 1'b0;
        M <= 4'b0;
    end

    else begin // n_rst == 1
        out <= ret [8:1];  // 9 bit ret의 0번째 부분 제외(Q_1부분 제외), out에 할당.
        count <= count + 4'b1111;  // 2의 보수로 덧셈. (실제로는 뺄셈, 4~0까지 빼기)
    end
end


if (count == 4'b0100) begin
    assign A = 4'b0;
    assign Q = in1;
    assign Q_1 = 1'b0;
    assign M = in2;

    assign ret = {A, Q, Q_1};
end

else if ((count > 4'b0000) && (count < 4'b0100)) begin
    case ({Q[0], Q_1})
        2'b10 : begin
                assign A = A + (~M + 4'b0001);
                assign ret = {A, Q, Q_1} >>> 1;
            end

        2'b01 : begin
            assign A = A + M;
            assign ret = {A, Q, Q_1} >>> 1;
        end 

        2'b00 : assign ret = {A, Q, Q_1} >>> 1;

        2'b11 : assign ret = {A, Q, Q_1} >>> 1;

        default : assign ret = 9'b0;      
    endcase
end

else begin
    assign ret = 9'b0;
end

endmodule
*/