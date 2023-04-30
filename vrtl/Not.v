/*  Not gate

Not u_Not(
    .in_i(),
    .out_o()
);

*/

module Not(
    input wire in_i,
    output wire out_o
);
    assign out_o = ~in_i;

endmodule