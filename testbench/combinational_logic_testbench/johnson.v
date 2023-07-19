module johnson_counter(
        clk,
        rst,
        out
);

// Declartion input, output part
input clk;
input rst;

output [3:0] out;

reg [3:0] inst_out;

// Code conditions part
always @(posedge clk or negedge rst) begin
        if (!rst) begin
                inst_out <= 4'b1000;
        end

        else begin
                if (inst_out >= 4'b1000 && inst_out < 4'b1111) begin
                        inst_out <= {1'b1, inst_out[3:1]};
                end

                else if (inst_out == 4'b1111) begin 
                        inst_out <= 4'b0111;
                end

                else if (inst_out >= 0001 && inst_out <= 4'b0111) begin
                        inst_out <= {1'b0, inst_out[3:1]};
                end

                else if (inst_out == 4'b0000) begin
                        inst_out <= 4'b1000;
                end

        end
        
end

assign out = inst_out;

endmodule

/*
// Declartion module part
module jhonson_counter(
    CLK,
    rst,
    out
);

// Declartion input, output part 
input CLK;
input rst;

output reg [3:0] out;

// main code, conditions part 
always @(posedge CLK or negedge rst) begin
    if (!rst) begin
        out <= 4'b0000;
    end

    else if (out == 4'b0000) begin
            out <= 4'b1000;
    end

    else if (out == 4'b1000) begin
            out <= 4'b1100;
    end

    else if (out == 4'b1100) begin
            out <= 4'b1110;
    end

    else if (out == 4'b1110) begin
            out <= 4'b1111;
    end

    else if (out == 4'b1111) begin
            out <= 4'b0111;
    end

    else if (out == 4'b0111) begin
            out <= 4'b0011;
    end

    else if (out == 4'b0011) begin
            out <= 4'b0001;
    end

    else if (out == 4'b0001) begin
            out <= 4'b0000;
    end
    
end


endmodule
*/