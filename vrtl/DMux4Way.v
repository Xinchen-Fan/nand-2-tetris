/*  DMux4Way

* 4-way demultiplexor:
* {a, b, c, d} = {in, 0, 0, 0} if sel == 00
*                {0, in, 0, 0} if sel == 01
*                {0, 0, in, 0} if sel == 10
*                {0, 0, 0, in} if sel == 11

DMux4Way u_DMux4Way(
    .in_i(),
    .sel_i(),
    .a_o(),
    .b_o(),
    .c_o(),
    .d_o()
);

*/

module DMux4Way(
    input wire in_i,
    input wire [1:0] sel_i,
    output wire a_o,
    output wire b_o,
    output wire c_o,
    output wire d_o
);
    assign a_o = sel_i[0] ? 1'b0 : (sel_i[1] ? 1'b0 : in_i);
    assign b_o = sel_i[0] ? (sel_i[1] ? 1'b0 : in_i) : 1'b0;
    assign c_o = sel_i[0] ? 1'b0 : (sel_i[1] ? in_i : 1'b0);
    assign d_o = sel_i[0] ? (sel_i[1] ? in_i : 1'b0) : 1'b0;

endmodule