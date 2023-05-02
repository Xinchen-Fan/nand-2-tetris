/*  16-bit register

Register u_Register(
    .clk_i(),
    .in_i(),
    .load_i(),
    .out_o()
);

*/



module Register(
    input wire clk_i,
    input wire [15:0] in_i,
    input wire load_i,
    output wire [15:0] out_o
);

    Bit u1_Bit(.clk_i(clk_i), .in_i(in_i[0]), .load_i(load_i), .out_o(out_o[0]));
    Bit u2_Bit(.clk_i(clk_i), .in_i(in_i[1]), .load_i(load_i), .out_o(out_o[1]));
    Bit u3_Bit(.clk_i(clk_i), .in_i(in_i[2]), .load_i(load_i), .out_o(out_o[2]));
    Bit u4_Bit(.clk_i(clk_i), .in_i(in_i[3]), .load_i(load_i), .out_o(out_o[3]));
    Bit u5_Bit(.clk_i(clk_i), .in_i(in_i[4]), .load_i(load_i), .out_o(out_o[4]));
    Bit u6_Bit(.clk_i(clk_i), .in_i(in_i[5]), .load_i(load_i), .out_o(out_o[5]));
    Bit u7_Bit(.clk_i(clk_i), .in_i(in_i[6]), .load_i(load_i), .out_o(out_o[6]));
    Bit u8_Bit(.clk_i(clk_i), .in_i(in_i[7]), .load_i(load_i), .out_o(out_o[7]));
    Bit u9_Bit(.clk_i(clk_i), .in_i(in_i[8]), .load_i(load_i), .out_o(out_o[8]));
    Bit u10_Bit(.clk_i(clk_i), .in_i(in_i[9]), .load_i(load_i), .out_o(out_o[9]));
    Bit u11_Bit(.clk_i(clk_i), .in_i(in_i[10]), .load_i(load_i), .out_o(out_o[10]));
    Bit u12_Bit(.clk_i(clk_i), .in_i(in_i[11]), .load_i(load_i), .out_o(out_o[11]));
    Bit u13_Bit(.clk_i(clk_i), .in_i(in_i[12]), .load_i(load_i), .out_o(out_o[12]));
    Bit u14_Bit(.clk_i(clk_i), .in_i(in_i[13]), .load_i(load_i), .out_o(out_o[13]));
    Bit u15_Bit(.clk_i(clk_i), .in_i(in_i[14]), .load_i(load_i), .out_o(out_o[14]));
    Bit u16_Bit(.clk_i(clk_i), .in_i(in_i[15]), .load_i(load_i), .out_o(out_o[15]));

endmodule