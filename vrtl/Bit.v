/*  1-bit register

Bit u_Bit(
    .clk_i(),
    .in_i(),
    .load_i(),
    .out_o()
);

*/



module Bit(
    input wire clk_i,
    input wire in_i,
    input wire load_i,
    output wire out_o
);

    wire in_new = load_i ? in_i : out_o;
    
    DFF u_DFF(
        .clk_i(clk_i),
        .in_i(in_new),
        .out_o(out_o)
    );

endmodule