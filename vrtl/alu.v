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

alu u_alu(
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

`include "defines.v"

module alu(
    input wire [`DataWidth-1:0] x_i,
    input wire [`DataWidth-1:0] y_i,
    input wire zx_i,
    input wire nx_i,
    input wire zy_i,
    input wire ny_i,
    input wire f_i,
    input wire no_i,
    output wire [`DataWidth-1:0] out_o,
    output wire zr_o,
    output wire ng_o
);

    wire [`DataWidth-1:0] zx_tmp;
    wire [`DataWidth-1:0] x_tmp;
    wire [`DataWidth-1:0] zy_tmp;
    wire [`DataWidth-1:0] y_tmp;
    wire [`DataWidth-1:0] sum_tmp;
    wire [`DataWidth-1:0] and_tmp;
    wire [`DataWidth-1:0] out_tmp;
    wire [`DataWidth-1:0] out_buf;
    assign out_o = out_buf;

    // deal with zx, nx, get new x : x_tmp
    assign zx_tmp = zx_i ? `ZeroWord : x_i;
    assign x_tmp = nx_i ? ~zx_tmp : zx_tmp;

    // deal with zy, ny, get new y : y_tmp 
    assign zy_tmp = zy_i ? `ZeroWord : y_i;
    assign y_tmp = ny_i ? ~zy_tmp : zy_tmp;

    // deal with f, get x+y or x&y
    assign sum_tmp = x_tmp + y_tmp;
    assign and_tmp = x_tmp & y_tmp;
    assign out_tmp = f_i ? sum_tmp : and_tmp;

    // deal with no, get out_buf
    assign out_buf = no_i ? ~out_tmp : out_tmp;

    // get zr
    assign zr_o = ~(|out_buf);

    // get ng
    assign ng_o = out_buf[15] ? 1'b1 : 1'b0;  

endmodule