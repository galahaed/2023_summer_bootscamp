module testbench();

reg [3:0] a;
reg [3:0] b;
reg [3:0] br_0;

wire [3:0] out;
wire [3:0] br;

full_sub inst_full_sub(
    .a(a),
    .b(b),
    .out(out),
    .br(br),
    .br_0(br_0)
);

initial 
begin
    /*
    a = 0;
    b = 0;
    br_0 = 0;

    #10;
    a = 0;
    b = 0;
    br_0 = 1;

    #10;
    a = 0;
    b = 1;
    br_0 = 0;

    #10;
    a = 0;
    b = 1;
    br_0 = 1;

    #10;
    a = 1;
    b = 0;
    br_0 = 0;

    #10;
    a = 1;
    b = 0;
    br_0 = 1;

    #10;
    a = 1;
    b = 1;
    br_0 = 0;

    #10;
    a = 1;
    b = 1;
    br_0 = 1;

    #10;
*/

    #10;
    a = 4'b0000;
    b = 4'b0111;
    br_0 = 4'b0000;

    #10;
    a = 4'b0000;
    b = 4'b0111;
    br_0 = 4'b0001;

    #10;
    a = 4'b0000;
    b = 4'b0111;
    br_0 = 4'b1111;
    
    
    #10;
    $stop;

end

endmodule