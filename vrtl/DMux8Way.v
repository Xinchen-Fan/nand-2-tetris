/*  DMux8Way

 * 8-way demultiplexor:
 * {a, b, c, d, e, f, g, h} = {in, 0, 0, 0, 0, 0, 0, 0} if sel == 000
 *                            {0, in, 0, 0, 0, 0, 0, 0} if sel == 001
 *                            etc.
 *                            {0, 0, 0, 0, 0, 0, 0, in} if sel == 111

DMux8Way u_DMux8Way(
    .in_i(),
    .sel_i(),
    .a_o(),
    .b_o(),
    .c_o(),
    .d_o(),
    .e_o(),
    .f_o(),
    .g_o(),
    .h_o()
);

*/


module DMux8Way(
    input wire in_i,
    input wire [2:0] sel_i,
    output wire a_o,
    output wire b_o,
    output wire c_o,
    output wire d_o,
    output wire e_o,
    output wire f_o,
    output wire g_o,
    output wire h_o
);

    wire tmp1;
    wire tmp2;

    DMux u_DMux(
        .in_i(in_i),
        .sel_i(sel_i[2]),
        .a_o(tmp1),
        .b_o(tmp2)
    );

    DMux4Way u1_DMux4Way(
        .in_i(tmp1),
        .sel_i(sel_i[1:0]),
        .a_o(a_o),
        .b_o(b_o),
        .c_o(c_o),
        .d_o(d_o)
    );

    DMux4Way u2_DMux4Way(
        .in_i(tmp2),
        .sel_i(sel_i[1:0]),
        .a_o(e_o),
        .b_o(f_o),
        .c_o(g_o),
        .d_o(h_o)
    );

endmodule
