/*  1-bit register

Bit u_Bit(
    .clk_i(),
    .din_i(),
    .dout_o()
);

*/



module Bit(
    input wire clk_i,
    input wire din_i,
    output reg dout_o
);
    always @(posedge clk_i) begin
        dout_o <= din_i;
    end

endmodule