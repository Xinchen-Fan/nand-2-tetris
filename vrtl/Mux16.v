/*  Mux16: 16-bit Mux

Mux16 u_Mux16(
    .a_i(),
    .b_i(),
    .sel_i(),
    .out_o()
);

*/

module Mux16(
    input wire [15:0] a_i,
    input wire [15:0] b_i,
    input wire sel_i,
    output wire [15:0] out_o
);
    assign out_o = sel_i ? b_i : a_i;

endmodule