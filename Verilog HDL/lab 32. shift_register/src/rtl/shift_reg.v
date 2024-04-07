// 4-bit shift_register_4bit 
module shift_register_4bit(
    clk,
    rst,
    shift_left,
    shift_right, 
    out
);

// Declaration input, output part
input clk;
input rst;
input shift_left;
input shift_right;
output reg [3:0] out;
/*
// Declaration register part 
reg [3:0] ins_out;

// Declaration conditions part 


always @(posedge clk or negedge rst) begin
    if(!rst) begin
        ins_out <= 4'b1010;
    end

    else begin
        if (shift_left) begin
            ins_out <= {ins_out[2:0], 1'b0};
        end

        else if (shift_right) begin
            ins_out <= {1'b0, ins_out[3:1]};
        end
    end
            
end
*/
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        out <= 4'b1010;
    end

    else begin
        if (shift_left) begin
            out <= {out[2:0], 1'b0};
        end

        else if(shift_right) begin 
            out <= {1'b0, out[3:1]};
        end
    end
end
/*
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        out <= 4'b0100;
    end

    else begin
    end
end

always @(*) begin
    if (shift_left) begin
        out <= {out[2:0], 1'b0};
    end

    else if (shift_right) begin
        out <= {1'b0, out[3:1]};
    end

end
*/

// Assignment declaration part
//assign out = ins_out;

endmodule