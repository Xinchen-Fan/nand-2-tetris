/*  8-word RAM

RAM8 u_RAM8(
    .clk_i(),
    .in_i(),
    .load_i(),
    .address_i(),
    .out_o()
);

*/



module RAM8(
    input wire clk_i,
    input wire [15:0] in_i,
    input wire load_i,
    input wire [2:0] address_i,
    output wire [15:0] out_o
);

    wire [7:0] load_real;
    wire [15:0] out_tmp [0:7];

    Register u1_Register(.clk_i(clk_i), .in_i(in_i), .load_i(load_real[0]), .out_o(out_tmp[0]));
    Register u2_Register(.clk_i(clk_i), .in_i(in_i), .load_i(load_real[1]), .out_o(out_tmp[1]));
    Register u3_Register(.clk_i(clk_i), .in_i(in_i), .load_i(load_real[2]), .out_o(out_tmp[2]));
    Register u4_Register(.clk_i(clk_i), .in_i(in_i), .load_i(load_real[3]), .out_o(out_tmp[3]));
    Register u5_Register(.clk_i(clk_i), .in_i(in_i), .load_i(load_real[4]), .out_o(out_tmp[4]));
    Register u6_Register(.clk_i(clk_i), .in_i(in_i), .load_i(load_real[5]), .out_o(out_tmp[5]));
    Register u7_Register(.clk_i(clk_i), .in_i(in_i), .load_i(load_real[6]), .out_o(out_tmp[6]));
    Register u8_Register(.clk_i(clk_i), .in_i(in_i), .load_i(load_real[7]), .out_o(out_tmp[7]));

    DMux8Way u_DMux8Way(
        .in_i(load_i),
        .sel_i(address_i),
        .a_o(load_real[0]),
        .b_o(load_real[1]),
        .c_o(load_real[2]),
        .d_o(load_real[3]),
        .e_o(load_real[4]),
        .f_o(load_real[5]),
        .g_o(load_real[6]),
        .h_o(load_real[7])
    );

    Mux8Way16 u_Mux8Way16(
        .a_i(out_tmp[0]),
        .b_i(out_tmp[1]),
        .c_i(out_tmp[2]),
        .d_i(out_tmp[3]),
        .e_i(out_tmp[4]),
        .f_i(out_tmp[5]),
        .g_i(out_tmp[6]),
        .h_i(out_tmp[7]),
        .sel_i(address_i),
        .out_o(out_o)
    );

endmodule