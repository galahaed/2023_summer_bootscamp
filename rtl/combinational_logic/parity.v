// module parity check (odd, even)
module parity(a, odd, even);

input [7:0] a;


output reg odd;
output reg even;

reg st_hub[3:0];
reg nd_hub[1:0];

always @(*) begin

    st_hub[0] = a[0] ^ a[1];
    st_hub[1] = a[2] ^ a[3];
    st_hub[2] = a[4] ^ a[5];
    st_hub[3] = a[6] ^ a[7];

    nd_hub[0] = st_hub[0] ^ st_hub[1];
    nd_hub[1] = st_hub[2] ^ st_hub[3];

    even = nd_hub[0] ^ nd_hub[1];
    odd = ~even;
    
end

endmodule