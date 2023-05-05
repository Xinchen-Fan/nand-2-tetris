/* Program Counter

 * A 16-bit counter with load and reset control bits.
 * if      (reset[t] == 1) out[t+1] = 0
 * else if (load[t] == 1)  out[t+1] = in[t]
 * else if (inc[t] == 1)   out[t+1] = out[t] + 1  (integer addition)
 * else                    out[t+1] = out[t]

    pc u_pc(
        .clk_i(),
        .in_i(),
        .load_i(),
        .inc_i(),
        .reset_i(),
        .out_o()
    );


 */

`include "defines.v"

 module pc(
    input wire clk_i,
    input wire [`DataWidth-1:0] in_i,
    input wire load_i,
    input wire inc_i,
    input wire reset_i,
    output wire [`DataWidth-1:0] out_o
);

    wire [`DataWidth-1:0] in_inc;
    wire [`DataWidth-1:0] in_tmp1;
    wire [`DataWidth-1:0] in_tmp2;
    wire [`DataWidth-1:0] in_new;
    wire [`DataWidth-1:0] out_buf;
    assign out_o = out_buf;

    assign in_inc = out_buf + 1'b1; // pc+1
    assign in_tmp1 = inc_i ? in_inc : out_buf; // +1 or hold
    assign in_tmp2 = load_i ? in_i : in_tmp1;  // load or (+1 or hold)

    register #(.WIDTH(`DataWidth), .RESET_VAL(`PCResetAddr)) u_pc_register(
        .clk_i(clk_i),
        .in_i(in_tmp2),
        .reset_i(reset_i),
        .load_i(1'b1),
        .out_o(out_buf)
    );


endmodule

