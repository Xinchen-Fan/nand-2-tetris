/*  Mux

Mux u_Mux(
    .a_i(),
    .b_i(),
    .sel_i(),
    .out_o()
);

*/

module Mux(
    input wire a_i,
    input wire b_i,
    input wire sel_i,
    output wire out_o
);
    assign out_o = sel_i ? b_i : a_i;

endmodule