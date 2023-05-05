/*  16-bit register

Register u_Register(
    .clk_i(),
    .in_i(),
    .load_i(),
    .out_o()
);

*/

module Register #(parameter WIDTH = 1, parameter RESET_VAL = 0) (
    input wire clk_i,
    input wire reset_i,
    input wire [WIDTH-1:0] in_i,
    input wire load_i,
    output reg [WIDTH-1:0] out_o
);
  always @ (posedge clk_i) begin
    if (reset_i) out_o <= RESET_VAL;
    else if (load_i) out_o <= in_i;
  end
endmodule

