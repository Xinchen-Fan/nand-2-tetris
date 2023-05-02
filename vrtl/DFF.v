/*  Data flip-flop gate

DFF u_DFF(
    .clk_i(),
    .in_i(),
    .out_o()
);

*/



module DFF(
    input wire clk_i,
    input wire in_i,
    output reg out_o
);
    always @(posedge clk_i) begin
        out_o <= in_i;
    end

endmodule