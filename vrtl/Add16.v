/*  Adds up two 16-bit two's complement values

Add16 u_Add16(
    .a_i(),
    .b_i(),
    .out_o()
);

*/

`include "./HalfAdder.v"
`include "./FullAdder.v"

module Add16(
    input wire [15:0] a_i,
    input wire [15:0] b_i,
    output wire [15:0] out_o
);

    wire [14:0] carry;

    HalfAdder u_HalfAdder(.a_i(a_i[0]), .b_i(b_i[0]), .sum_o(out_o[0]), .carry_o(carry[0]));
    FullAdder u1_FullAdder(.a_i(a_i[1]), .b_i(b_i[1]), .c_i(carry[0]), .sum_o(out_o[1]), .carry_o(carry[1]));
    FullAdder u2_FullAdder(.a_i(a_i[2]), .b_i(b_i[2]), .c_i(carry[1]), .sum_o(out_o[2]), .carry_o(carry[2]));
    FullAdder u3_FullAdder(.a_i(a_i[3]), .b_i(b_i[3]), .c_i(carry[2]), .sum_o(out_o[3]), .carry_o(carry[3]));
    FullAdder u4_FullAdder(.a_i(a_i[4]), .b_i(b_i[4]), .c_i(carry[3]), .sum_o(out_o[4]), .carry_o(carry[4]));
    FullAdder u5_FullAdder(.a_i(a_i[5]), .b_i(b_i[5]), .c_i(carry[4]), .sum_o(out_o[5]), .carry_o(carry[5]));
    FullAdder u6_FullAdder(.a_i(a_i[6]), .b_i(b_i[6]), .c_i(carry[5]), .sum_o(out_o[6]), .carry_o(carry[6]));
    FullAdder u7_FullAdder(.a_i(a_i[7]), .b_i(b_i[7]), .c_i(carry[6]), .sum_o(out_o[7]), .carry_o(carry[7]));
    FullAdder u8_FullAdder(.a_i(a_i[8]), .b_i(b_i[8]), .c_i(carry[7]), .sum_o(out_o[8]), .carry_o(carry[8]));
    FullAdder u9_FullAdder(.a_i(a_i[9]), .b_i(b_i[9]), .c_i(carry[8]), .sum_o(out_o[9]), .carry_o(carry[9]));
    FullAdder u10_FullAdder(.a_i(a_i[10]), .b_i(b_i[10]), .c_i(carry[9]), .sum_o(out_o[10]), .carry_o(carry[10]));
    FullAdder u11_FullAdder(.a_i(a_i[11]), .b_i(b_i[11]), .c_i(carry[10]), .sum_o(out_o[11]), .carry_o(carry[11]));
    FullAdder u12_FullAdder(.a_i(a_i[12]), .b_i(b_i[12]), .c_i(carry[11]), .sum_o(out_o[12]), .carry_o(carry[12]));
    FullAdder u13_FullAdder(.a_i(a_i[13]), .b_i(b_i[13]), .c_i(carry[12]), .sum_o(out_o[13]), .carry_o(carry[13]));
    FullAdder u14_FullAdder(.a_i(a_i[14]), .b_i(b_i[14]), .c_i(carry[13]), .sum_o(out_o[14]), .carry_o(carry[14]));
    FullAdder u15_FullAdder(.a_i(a_i[15]), .b_i(b_i[15]), .c_i(carry[14]), .sum_o(out_o[15]), .carry_o());

endmodule