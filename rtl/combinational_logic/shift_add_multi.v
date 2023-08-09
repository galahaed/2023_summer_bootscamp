
module shift_add_multi_4bit(clk, n_rst, a, b, out);

input clk;
input n_rst;

input [3:0] a;
input [3:0] b;

output reg [7:0] out;

reg [7:0] sum;  // Register sum(temp) declaration.

// temp wires.

wire [7:0] tmp0;
wire [7:0] tmp1;
wire [7:0] tmp2;
wire [7:0] tmp3;


// Flip flop declaration part.
always @(posedge clk or negedge n_rst) begin
    if (!n_rst) begin
        out <= 8'b0;
    end

    else begin
        out <= sum;
    end
end

shift_calc inst_sc1(.a(a), .b(b[0]), .shift(2'b00), .s_tmp(tmp0));
shift_calc inst_sc2(.a(a), .b(b[1]), .shift(2'b01), .s_tmp(tmp1));
shift_calc inst_sc3(.a(a), .b(b[2]), .shift(2'b10), .s_tmp(tmp2));
shift_calc inst_sc4(.a(a), .b(b[3]), .shift(2'b11), .s_tmp(tmp3));
// temp file sum assignment 
assign sum = tmp0 + tmp1 + tmp2 + tmp3;

endmodule


module shift_calc(a, b, shift, s_tmp);

input [3:0] a;
input b;
input [1:0] shift;  // instance에서 몇 번 shift하는지가 binary number로 0~3까지 하니까 
                    // 각각 2'b00, 2'b01, 2'b10, 2'b11이므로 shift_calc module에서 input shift에 2bit 메모리 할당.

output [7:0] s_tmp; // shift temp.

// module shift_calc s_tmp assignment.
assign s_tmp = (a * b) << shift;

endmodule