/*  Mux8Way16: 8-way 16-bit multiplexor

 
 * out = a if sel == 000
 *       b if sel == 001
 *       etc.
 *       h if sel == 111


Mux8Way16 u_Mux8Way16(
    .a_i(),
    .b_i(),
    .c_i(),
    .d_i(),
    .e_i(),
    .f_i(),
    .g_i(),
    .h_i(),
    .sel_i(),
    .out_o()
);

*/


module Mux8Way16(
    input wire [15:0] a_i,
    input wire [15:0] b_i,
    input wire [15:0] c_i,
    input wire [15:0] d_i,
    input wire [15:0] e_i,
    input wire [15:0] f_i,
    input wire [15:0] g_i,
    input wire [15:0] h_i,
    input wire [2:0] sel_i,
    output wire [15:0] out_o
);

    wire [15:0] tmp1;
    wire [15:0] tmp2;

    Mux4Way16 u1_Mux4Way16(
        .a_i(a_i),
        .b_i(b_i),
        .c_i(c_i),
        .d_i(d_i),
        .sel_i(sel_i[1:0]),
        .out_o(tmp1)
    );
    
    Mux4Way16 u2_Mux4Way16(
        .a_i(e_i),
        .b_i(f_i),
        .c_i(g_i),
        .d_i(h_i),
        .sel_i(sel_i[1:0]),
        .out_o(tmp2)
    );

    Mux16 u_Mux16(
        .a_i(tmp1),
        .b_i(tmp2),
        .sel_i(sel_i[2]),
        .out_o(out_o)
    );
    
endmodule
