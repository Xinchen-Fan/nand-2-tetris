/*  Mux4Way16: 4-way 16-bit multiplexor

 
out =   a if sel == 00
        b if sel == 01
        c if sel == 10
        d if sel == 11


Mux4Way16 u_Mux4Way16(
    .a_i(),
    .b_i(),
    .c_i(),
    .d_i(),
    .sel_i(),
    .out_o()
);

*/

module Mux4Way16(
    input wire [15:0] a_i,
    input wire [15:0] b_i,
    input wire [15:0] c_i,
    input wire [15:0] d_i,
    input wire [1:0] sel_i,
    output wire [15:0] out_o
);
    assign out_o = sel_i[0] ? (sel_i[1] ? d_i : b_i) : (sel_i[1] ? c_i : a_i);

endmodule

