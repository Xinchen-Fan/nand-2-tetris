/*   Sets out to in + 1

Inc16 u_Inc16(
    .in_i(),
    .out_o()
);

*/


module Inc16(
    input wire [15:0] in_i,
    output wire [15:0] out_o
);

    Add16 u_Add16(
        .a_i(in_i),
        .b_i(16'b1),
        .out_o(out_o)
    );



endmodule