/*  And16: 16-bit And gate

And16 u_And16(
    .a_i(),
    .b_i(),
    .out_o()
);

*/

module And16(
    input wire [15:0] a_i,
    input wire [15:0] b_i,
    output wire [15:0] out_o
);
    assign out_o = a_i & b_i;

endmodule