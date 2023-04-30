/*  Or8Way: 8-way Or gate

Or8Way u_Or8Way(
    .in_i(),
    .out_o()
);

*/

module Or8Way(
    input wire [7:0] in_i,
    output wire out_o
);
    assign out_o = |in_i;

endmodule