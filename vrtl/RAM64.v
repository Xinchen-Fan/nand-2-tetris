/*  64-word RAM

RAM64 u_RAM64(
    .clk_i(),
    .in_i(),
    .load_i(),
    .address_i(),
    .out_o()
);

*/



module RAM64(
    input wire clk_i,
    input wire [15:0] in_i,
    input wire load_i,
    input wire [5:0] address_i,
    output wire [15:0] out_o
);

    wire [7:0] load_real;
    wire [15:0] out_tmp [0:7];

    RAM8 u1_RAM8(.clk_i(clk_i), .in_i(in_i), .load_i(load_real[0]), .address_i(address_i[2:0]), .out_o(out_tmp[0]));
    RAM8 u2_RAM8(.clk_i(clk_i), .in_i(in_i), .load_i(load_real[1]), .address_i(address_i[2:0]), .out_o(out_tmp[1]));
    RAM8 u3_RAM8(.clk_i(clk_i), .in_i(in_i), .load_i(load_real[2]), .address_i(address_i[2:0]), .out_o(out_tmp[2]));
    RAM8 u4_RAM8(.clk_i(clk_i), .in_i(in_i), .load_i(load_real[3]), .address_i(address_i[2:0]), .out_o(out_tmp[3]));
    RAM8 u5_RAM8(.clk_i(clk_i), .in_i(in_i), .load_i(load_real[4]), .address_i(address_i[2:0]), .out_o(out_tmp[4]));
    RAM8 u6_RAM8(.clk_i(clk_i), .in_i(in_i), .load_i(load_real[5]), .address_i(address_i[2:0]), .out_o(out_tmp[5]));
    RAM8 u7_RAM8(.clk_i(clk_i), .in_i(in_i), .load_i(load_real[6]), .address_i(address_i[2:0]), .out_o(out_tmp[6]));
    RAM8 u8_RAM8(.clk_i(clk_i), .in_i(in_i), .load_i(load_real[7]), .address_i(address_i[2:0]), .out_o(out_tmp[7]));

    DMux8Way u_DMux8Way(
        .in_i(load_i),
        .sel_i(address_i[5:3]),
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
        .sel_i(address_i[5:3]),
        .out_o(out_o)
    );

endmodule