/*  Or16: 16-bit Or gate

Or16 u_Or16(
    .a_i(),
    .b_i(),
    .out_o()
);

*/

module Or16(
    input wire [15:0] a_i,
    input wire [15:0] b_i,
    output wire [15:0] out_o
);
    assign out_o = a_i | b_i;

endmodule