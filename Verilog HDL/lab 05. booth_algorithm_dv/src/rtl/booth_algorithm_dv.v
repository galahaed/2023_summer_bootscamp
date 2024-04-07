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

reg [7:0] ret;  // result

always @(posedge clk or negedge n_rst) begin
    if (!n_rst) begin
        out     <=      8'b0;
        A       <=      4'b0;
        Q       <=      4'b0;
        M       <=      4'b0;
    end

    else begin  // n_rst == 1
        out     <=      ret;
    end
end


always @(posedge clk or negedge n_rst) begin
    if (!n_rst) begin
        count <= 4'b0;
    end 

    else begin // n_rst == 1
        count <= count + 4'b0001;
    end
end

always @(*) begin
    if (count == 4'b0001) begin
        A = 4'b0;
        Q = in1;
        M = in2;
    end

    else if ((count > 4'b0001) && (count <= 4'b0101)) begin
        {A, Q} = {A , Q} << 1;
        A = A + (~M + 4'b0001);

        // 5'b10000, 5'b100001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111, 5'b11000, ...
    
        // if ((A > 5'b11111) && (A < 4'b0000)) begin  // -15 < A < 0
        if (A[3] == 1'b1) begin
            Q[0] = 1'b0;
            A = A + M;
        end

        else begin 
            Q[0] = 1'b1;
        end

        ret = {A, Q};
    end
    
    else begin
        ret = {A, Q};
    end
end


endmodule




/*
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
        A       <=      4'b0;
        Q       <=      4'b0;
        M       <=      4'b0;
    end

    else begin  // n_rst == 1
        out     <=      {A, Q};
    end
end

always @(posedge clk or negedge n_rst) begin
    if (!n_rst) begin
        count <= 4'b0;
    end 

    else begin // n_rst == 1
        count <= count + 4'b0001;
    end
end

always @(*) begin
    if (count == 4'b0001) begin
        A = 4'b0;
        Q = in1;
        M = in2;
    end

    else if ((count > 4'b0001) && (count <= 4'b0101)) begin
        {A, Q} = {A, Q} << 1;
        A = A + (~M + 4'b0001);
        
        
        if ((A == 4'b1111) || (A == 4'b1110) || (A == 4'b1100) || (A == 4'b1000)) begin
            Q[0] = 1'b0;
            A = A + M;
        end
        
        else begin // A == 0 or A > 0 
            Q[0] = 1'b1;
        end
        
    end

    else begin
        {A, Q} = {A, Q};
    end
end

assign out = {A, Q};

endmodule
*/




/*
module booth_algorithm_dv(
    input clk,
    input n_rst,

    input [3:0] in1,
    input [3:0] in2,
    
    output reg [7:0] out
);

reg [3:0] A;
reg [3:0] Q;
reg [3:0] M;
reg [3:0] M_tmp;
reg [7:0] tmp;

reg [3:0] count;

always @(posedge clk or negedge n_rst) begin
    if (!n_rst) begin
        out <= 8'b0;
    end

    else begin // n_rst == 1
        if (!count) begin
            out <= tmp;
        end

        else begin
            tmp <= tmp;
        end
    end
end


always @(*) begin
    if (count == 4'b0100) begin
        A = 4'b0;
        Q = in1;
        M = in2;
    end

    else if ((count < 4'b0100) && (count > 4'b0000)) begin
        tmp = {A, Q} << 1;
        M_tmp = ~M + 4'b0001;
        tmp = tmp [7:4] + M_tmp;

        if (tmp [7:4] < 4'b0000) begin
            Q[0] = 1'b0;
            tmp = tmp[7:4] + M;
            count = count + 4'b1111;
        end

        else begin  // tmp [7:4] >= 4'b0000
            Q[0] = 1'b1;
            count = count + 4'b1111;
        end
    end

end


endmodule
*/