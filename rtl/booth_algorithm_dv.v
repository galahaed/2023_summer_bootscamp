module booth_algorithm_dv(
    input clk,
    input n_rst,

    input [3:0] in1,
    input [3:0] in2,
    
    output reg [7:0] out
);

reg [3:0] count;
reg [3:0] A;
reg [3:0] Q;
reg [3:0] M;

always @(posedge clk or negedge n_rst) begin
    if (!n_rst) begin
        out     <=      8'b0;
        count   <=      4'b0;
        A       <=      4'b0;
        Q       <=      4'b0;
        M       <=      4'b0;
    end

    else begin  // n_rst == 1
        out     <=      {A, Q};
        count   <=      count + 4'b0001;
    end
end

always @(*) begin
    if (count == 4'b0001) begin
        A = 4'b0;
        Q = in1;
        M = in2;
    end

    else if ((count > 4'b0000) && (count <= 4'b0101)) begin
        {A, Q} = {A, Q} << 1;
        A = A + (~M + 4'b0001);

        if (A < 0) begin
            Q[0] = 1'b0;
            A = A + M;
        end
        
        else begin // A == 0 or A > 0 
            Q[0] = 1'b1;
        end
    end
end

assign out = {A, Q};

endmodule