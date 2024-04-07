
module booth_algorithm(
    input clk,
    input n_rst,

    input [3:0] in1,  // 4 bit in1;
    input [3:0] in2,  // 4 bit in2;
    
    output reg [7:0] out  // 8 bit out;
);

parameter ms = 4; // memory size;

reg [8:0] result;  // 9 bit result;
reg [ms-1:0] count;  // count;

reg [ms-1:0] A;
reg [ms-1:0] Q;
reg Q_1;
reg [ms-1:0] M;


always @(posedge clk or negedge n_rst) begin
    if (!n_rst) begin
        out     <=     8'b0;
        count   <=     4'b0;
        result  <=     9'b0;
        A       <=     4'b0;
        Q       <=     4'b0;
        Q_1     <=     1'b0;
        M       <=     4'b0;
    end

    else begin  // n_rst == 1;
        out     <=      result[8:1];
        count   <=      count + 4'b0001;
    end

end


always @(*) begin

    if (count == 4'b0001) begin
        A       =       4'b0;
        Q       =       in1;
        Q_1     =       1'b0;
        M       =       in2;

        result  =   {A, Q, Q_1};
    end
    
    else if ((count > 4'b0000) && (count <= 4'b0101)) begin
        case ({Q[0], Q_1}) 
            2'b10 : begin
                A = A + (~M + 4'b0001);
            end

            2'b01 : begin
                A = A + M;
            end 

            default : begin
                A = A;
            end
                
        endcase

        {A, Q, Q_1} = {A[3], A, Q};

        result = {A, Q, Q_1};
    end

    else begin
        result = {A, Q, Q_1};        
    end
end

assign out = result[8:1];

endmodule
/*
always @(*) begin
    if (count == 4'b0001) begin
        A = 4'b0;
        Q = in1; 
        Q_1 = 1'b0;
        M = in2;
    end

    else if ((coun))
end
*/

/*
always @(posedge clk or negedge n_rst) begin
    if (!n_rst) begin
        count <= 4'b0;
    end 

    else begin
        count <= count + 4'b0001;
    end
end
*/

/*
module booth_algorithm(
    input clk,
    input n_rst,

    input [3:0] in1,  // 4 bit in1;
    input [3:0] in2,  // 4 bit in2;
    
    output reg [7:0] out  // 8 bit out;
);

reg [8:0] result;  // 9 bit result;
reg [3:0] count;  // count;

reg [3:0] A;
reg [3:0] Q;
reg Q_1;
reg [3:0] M;

always @(posedge clk or negedge n_rst) begin
    if (!n_rst) begin
        out <= 8'b0;
    end

    else begin  // n_rst == 1;
        out <= {result[8:1]};
    end
end


always @(posedge clk or negedge n_rst) begin
    if (count == 4'b0000) begin
        A <= 4'b0;
        Q <= in2;
        Q_1 <= 1'b0;
        M <= in1;
    end
    
    else if ((count > 4'b0000) && (count < 4'b0100)) begin
        case ({Q[0], Q_1}) 
            2'b10 : begin
                A <= A + {~M + 4'b0001};
                {A, Q, Q_1} <= {A, Q, Q_1} >>> 1;
            end

            2'b01 : begin
                A <= A + M;
                {A, Q, Q_1} <= {A, Q, Q_1} >>> 1;
            end

            default : begin
                {A, Q, Q_1} <= {A, Q, Q_1} >>> 1;
            end
                
        endcase
    end

    else if (count == 4'b0100) begin
        result <= {A, Q, Q_1};
    end
end

endmodule
*/

/*
module booth_algorithm(clk, n_rst, in1, in2, out);

input clk;
input n_rst;

input [3:0] in1; // 4bit
input [3:0] in2; // 4bit

output reg [7:0] out; // 8bit

reg [8:0] result; // 9bit (include Q_1)
                  // Struct -> {A, Q, Q_1}

always @(posedge clk or negedge n_rst) begin
    if (!n_rst) begin
        out <= 8'b0;
    end

    else begin
        out <= result[8:1];
    end
end

case_st inst_cs1(.A(4'b0000), .Q(in1), .Q_1(1'b0), .M(in2));
case_st inst_cs2(.A(result[8:5]), .Q(result[4:1]), .Q_1(result[0]), .M(M));
case_st inst_cs3(.A(result[8:5]), .Q(result[4:1]), .Q_1(result[0]), .M(M));
case_st inst_cs4(.A(result[8:5]), .Q(result[4:1]), .Q_1(result[0]), .M(M));


endmodule


module case_st(A, Q, Q_1, M, result);

input [3:0] A;
input [3:0] Q;
input Q_1;
input [3:0] M;

output reg [8:0] result;

reg [3:0] AA;
reg [3:0] MM;


always @(*) begin

    AA = A;
    MM = M;

    case({Q[0], Q_1})

        2'b01 : begin
            AA = AA + M;
            result = {AA, Q, Q_1} >>> 1;
        end

        2'b10 : begin
            MM = ~MM + 4'b0001;
            AA = AA + MM;
            result = {AA, Q, Q_1} >>> 1;
        end

        2'b00 : begin
            result = {AA, Q, Q_1} >>> 1;
        end

        2'b11 : begin
            result = {AA, Q, Q_1} >>> 1;
        end
        
        default : begin
            result = 9'b0;
        end

    endcase
end

endmodule
*/

/*
module booth_algorithm(
    input clk,
    input n_rst,
    input [3:0] in1,
    input [3:0] in2,
    output reg [7:0] out 
);

wire [3:0] count;
wire [7:0] tmp = {A, Q, Q_1};
wire [3:0] A;
wire [3:0] Q;
wire [3:0] Q_1;

reg [3:0] M;



always @(posedge clk or negedge n_rst) begin
    if(!n_rst) begin
        out <= 8'b0;
    end

    else begin
        out <= tmp;
        
    end    
end

assign begin
    if (count == 4'b0000) begin
        A = 4'b0000;
        Q = in1;
        Q_1 = 1'b0;
        M = in2;
    end

    else if ((count <= 4'b0100) && (count > 4'b0000)) begin
        case ({Q[0], Q_1}) 
            2'b10 : begin
                A = A + (~M + 4'b0001);
            end

            2'b01 : begin
                A = A + M;
            end 

            default : begin
                A = A;
            end
                
        endcase

        tmp = {A, Q, Q_1} >>> 1;
    end
    
    else begin
        tmp = {A, Q, Q_1};
    end
end

assign count = count + 1'b1;

endmodule
*/