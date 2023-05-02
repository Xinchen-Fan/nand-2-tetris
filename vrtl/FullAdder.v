/*  Computes the sum of three bits.

FullAdder u_FullAdder(
    .a_i(),
    .b_i(),
    .c_i(),
    .sum_o(),
    .carry_o()
);

*/


module FullAdder(
    input wire a_i,
    input wire b_i,
    input wire c_i,
    output wire sum_o,
    output wire carry_o
);

    wire tmp_sum;
    wire tmp_carry1;
    wire tmp_carry2;

    HalfAdder u1_HalfAdder(
        .a_i(a_i),
        .b_i(b_i),
        .sum_o(tmp_sum),
        .carry_o(tmp_carry1)
    );

    HalfAdder u2_HalfAdder(
        .a_i(c_i),
        .b_i(tmp_sum),
        .sum_o(sum_o),
        .carry_o(tmp_carry2)
    );
    
    Or u_Or(
        .a_i(tmp_carry1),
        .b_i(tmp_carry2),
        .out_o(carry_o)
    );

endmodule
