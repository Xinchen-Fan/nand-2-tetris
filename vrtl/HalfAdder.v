/*  Computes the sum of two bits.

HalfAdder u_HalfAdder(
    .a_i(),
    .b_i(),
    .sum_o(),
    .carry_o()
);

*/

`include "./Xor.v"
`include "./And.v"

module HalfAdder(
    input wire a_i,
    input wire b_i,
    output wire sum_o,
    output wire carry_o
);

    Xor u_Xor(
        .a_i(a_i),
        .b_i(b_i),
        .out_o(sum_o)
    );
    
    And u_And(
        .a_i(a_i),
        .b_i(b_i),
        .out_o(carry_o)
    );

endmodule