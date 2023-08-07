
module code_converter_gb(g, b);

input [3:0] g; // 4bit gray code

output reg [3:0] b; // 4bit binary code

always @(g) begin
    b[3] = g[3];
    b[2] = b[3] ^ g[2];
    b[1] = b[2] ^ g[1];
    b[0] = b[1] ^ g[0];
end

endmodule