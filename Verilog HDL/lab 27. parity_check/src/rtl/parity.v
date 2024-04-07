/*
module parity_check_even(a, p);

input [7:0] a;

output p; 

assign p = (a[0] ^ a[1]) ^ (a[2] ^ a[3]) ^ (a[4] ^ a[5]) ^ (a[6] ^ a[7]);


endmodule
*/

module parity_check_odd(a, p);

input [7:0] a;

output p; 

assign p = ~((a[0] ^ a[1]) ^ (a[2] ^ a[3]) ^ (a[4] ^ a[5]) ^ (a[6] ^ a[7]));


endmodule
