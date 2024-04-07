module testbench();
    reg [3:0] a;
    reg [3:0] b;
    reg sign;

    wire [3:0] c_out;
    wire [3:0] s;

    add_sub_4bit inst_as4(
        .a(a),
        .b(b),
        .sign(sign),
        .c_out(c_out),
        .s(s)
    );

    initial begin
        #0;
        a = 4'b1010;
        b = 4'b0011;
        sign = 1'b0;

        #20;
        a = 4'b1100;
        b = 4'b0010;
        sign = 1'b1;

        #20;
        $stop;
    end

endmodule