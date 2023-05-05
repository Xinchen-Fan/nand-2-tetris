/*  general register

    register #(.WIDTH(), .RESET_VAL()) u_pc_register(
        .clk_i(),
        .in_i(),
        .reset_i(),
        .load_i(),
        .out_o()
    );

*/

`include "defines.v"

module register #(
    parameter WIDTH = 1, 
    parameter RESET_VAL = 0) (
    input wire clk_i,
    input wire reset_i,
    input wire [WIDTH-1:0] in_i,
    input wire load_i,
    output reg [WIDTH-1:0] out_o
);
    always @ (posedge clk_i) begin
        if (reset_i) begin
            out_o <= RESET_VAL;
        end
    else if (load_i) begin 
            out_o <= in_i;
    end
    end
endmodule

