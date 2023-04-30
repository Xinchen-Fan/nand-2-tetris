/*  And gate

And u_And(
    .a_i(),
    .b_i(),
    .out_o()
);

*/

module And(
    input wire a_i,
    input wire b_i,
    output wire out_o
);
    assign out_o = a_i & b_i;

endmodule