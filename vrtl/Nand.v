/*  Nand gate

Nand u_Nand(
    .a_i(),
    .b_i(),
    .out_o()
)

*/

module Nand(
    input wire a_i,
    input wire b_i,
    output wire out_o
);
    assign out_o = a_i ^ b_i;

endmodule