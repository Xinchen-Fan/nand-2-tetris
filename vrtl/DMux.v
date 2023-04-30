/*  DMux
 * Demultiplexor:
 * {a, b} = {in, 0} if sel == 0
 *          {0, in} if sel == 1

DMux u_DMux(
    .in_i(),
    .sel_i(),
    .a_o(),
    .b_o()
);

*/

module DMux(
    input wire in_i,
    input wire sel_i,
    output wire a_o,
    output wire b_o
);
    assign a_o = sel_i ? 1'b0 : in_i;
    assign b_o = sel_i ? in_i : 1'b0;

endmodule