/*   16-bit alu for Hack CPU

The ALU (Arithmetic Logic Unit).
Computes one of the following functions:
x+y, x-y, y-x, 0, 1, -1, x, y, -x, -y, ~x, ~y,
x+1, y+1, x-1, y-1, x&y, x|y on two 16-bit inputs, 
according to 6 input bits denoted zx,nx,zy,ny,f,no.
In addition, the ALU computes two 1-bit outputs:
if the ALU output == 0, zr is set to 1; otherwise zr is set to 0;
if the ALU output < 0, ng is set to 1; otherwise ng is set to 0.

Implementation: the ALU logic manipulates the x and y inputs
and operates on the resulting values, as follows:
ALU(x= ,y= ,zx= ,nx= ,zy= ,ny= ,f= ,no= ,out= ,zr= ,ng= )
if (zx == 1) set x = 0        // 16-bit constant
if (nx == 1) set x = ~x       // bitwise not
if (zy == 1) set y = 0        // 16-bit constant
if (ny == 1) set y = ~y       // bitwise not
if (f == 1)  set out = x + y  // integer 2's complement addition
if (f == 0)  set out = x & y  // bitwise and
if (no == 1) set out = ~out   // bitwise not
if (out == 0) set zr = 1
if (out < 0) set ng = 1

ALU u_ALU(
    .x_i(),
    .y_i(),
    .zx_i(),
    .nx_i(),
    .zy_i(),
    .ny_i(),
    .f_i(),
    .no_i(),
    .out_o(),
    .zr_o(),
    .ng_o()
);

*/


module ALU(
    input wire [15:0] x_i,
    input wire [15:0] y_i,
    input wire zx_i,
    input wire nx_i,
    input wire zy_i,
    input wire ny_i,
    input wire f_i,
    input wire no_i,
    output wire [15:0] out_o,
    output wire zr_o,
    output wire ng_o
);

    wire [15:0] zx_tmp;
    wire [15:0] notx_tmp;
    wire [15:0] x_tmp;
    wire [15:0] zy_tmp;
    wire [15:0] noty_tmp;
    wire [15:0] y_tmp;
    wire [15:0] sum_tmp;
    wire [15:0] and_tmp;
    wire [15:0] out_tmp;
    wire [15:0] notout_tmp;
    wire [15:0] out_buf;
    assign out_o = out_buf;

    // deal with zx, nx, get new x : x_tmp
    Mux16 u1_Mux16(.a_i(x_i), .b_i(16'b0), .sel_i(zx_i), .out_o(zx_tmp));
    Not16 u2_Not16(.in_i(zx_tmp), .out_o(notx_tmp));
    Mux16 u3_Mux16(.a_i(zx_tmp), .b_i(notx_tmp), .sel_i(nx_i), .out_o(x_tmp));

    // deal with zy, ny, get new y : y_tmp 
    Mux16 u4_Mux16(.a_i(y_i), .b_i(16'b0), .sel_i(zy_i), .out_o(zy_tmp));
    Not16 u5_Not16(.in_i(zy_tmp), .out_o(noty_tmp));
    Mux16 u6_Mux16(.a_i(zy_tmp), .b_i(noty_tmp), .sel_i(ny_i), .out_o(y_tmp));

    // deal with f, get x+y or x&y
    Add16 u7_Add16(.a_i(x_tmp), .b_i(y_tmp), .out_o(sum_tmp));
    And16 u8_And16(.a_i(x_tmp), .b_i(y_tmp), .out_o(and_tmp));
    Mux16 u9_Mux16(.a_i(and_tmp), .b_i(sum_tmp), .sel_i(f_i), .out_o(out_tmp));

    // deal with no, get out_buf
    Not16 u10_Not16(.in_i(out_tmp), .out_o(notout_tmp));
    Mux16 u11_Mux16(.a_i(out_tmp), .b_i(notout_tmp), .sel_i(no_i), .out_o(out_buf));

    // get zr
    assign zr_o = ~(|out_buf);

    // get ng
    assign ng_o = out_buf[15] ? 1'b1 : 1'b0;  

endmodule