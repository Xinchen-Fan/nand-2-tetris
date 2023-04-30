/*  Not16: 16-bit Not gate

Not16 u_Not16(
    .in_i(),
    .out_o()
);

*/

module Not16(
    input wire [15:0] in_i,
    output wire [15:0] out_o
);
    assign out_o = ~in_i;

endmodule