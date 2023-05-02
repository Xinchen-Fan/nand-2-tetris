/* Program Counter

 * A 16-bit counter with load and reset control bits.
 * if      (reset[t] == 1) out[t+1] = 0
 * else if (load[t] == 1)  out[t+1] = in[t]
 * else if (inc[t] == 1)   out[t+1] = out[t] + 1  (integer addition)
 * else                    out[t+1] = out[t]

PC u_PC(
    .clk_i(),
    .in_i(),
    .load_i(),
    .inc_i(),
    .reset_i(),
    .out_o()
);


 */

 module PC(
    input wire clk_i,
    input wire [15:0] in_i,
    input wire load_i,
    input wire inc_i,
    input wire reset_i,
    output wire [15:0] out_o
);

    wire [15:0] in_inc;
    wire [15:0] in_tmp1;
    wire [15:0] in_tmp2;
    wire [15:0] in_new;
    wire [15:0] out_buf;
    assign out_o = out_buf;

    Inc16 u_Inc16(.in_i(out_buf), .out_o(in_inc));
    Mux16 u1_Mux16(.a_i(out_buf), .b_i(in_inc), .sel_i(inc_i), .out_o(in_tmp1));
    Mux16 u2_Mux16(.a_i(in_tmp1), .b_i(in_i), .sel_i(load_i), .out_o(in_tmp2));
    Mux16 u3_Mux16(.a_i(in_tmp2), .b_i(16'b0), .sel_i(reset_i), .out_o(in_new));

    Register u_Register(.clk_i(clk_i), .in_i(in_new), .load_i(1'b1), .out_o(out_buf));


endmodule

