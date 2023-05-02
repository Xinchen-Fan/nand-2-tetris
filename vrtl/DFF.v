/*  Data flip-flop gate

DFF u_DFF(
    .clk_i(),
    .din_i(),
    .dout_o()
);

*/



module DFF(
    input wire clk_i,
    input wire din_i,
    output reg dout_o
);
    always @(posedge clk_i) begin
        dout_o <= din_i;
    end

endmodule