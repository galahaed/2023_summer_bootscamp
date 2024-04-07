module testbench();
    reg [3:0] a;
    reg [3:0] b;
    reg sign;

    wire [3:0] out;

    add_sub_4bit inst_as4(
        .a(a),
        .b(b),
        .sign(sign),
        .out(out),
    );

    initial begin
        a = 4'b1010;  // 10
        b = 4'b0011;  //  3
        sign = 1'b0;  // sum

        #20;
        a = 4'b1100;  // 12
        b = 4'b0010;  //  2
        sign = 1'b1;  // sub

        #20;
        $stop;
    end

endmodule


/*
module testbench();
    reg [3:0] a;
    reg [3:0] b;
    reg sign;

    wire [3:0] out;
    wire [3:0] s;

    add_sub_4bit inst_as4(
        .a(a),
        .b(b),
        .sign(sign),
        .c_out(c_out),
        .s(s)
    );

    initial begin
        a = 4'b1010;  // 10
        b = 4'b0011;  //  3
        sign = 1'b0;  // sum

        #20;
        a = 4'b1100;  // 12
        b = 4'b0010;  //  2
        sign = 1'b1;  // sub

        #20;
        $stop;
    end

endmodule
*/