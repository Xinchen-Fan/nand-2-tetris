`include "defines.v"

module top(
    input wire clk,
    input wire reset
);

    wire [`InstAddrWidth-1:0] pc;
    wire [`InstWidth-1:0] instruction;
    wire dmem_en;
    wire [`DataAddrWidth-1:0] dmem_addr;
    wire [`DataWidth-1:0] data_out;
    wire [`DataWidth-1:0] data_in;

    ram u_ram(
        .clk_i(clk), 
        .reset_i(reset), 
        .load_i(dmem_en), 
        .addr_i(dmem_addr), 
        .data_i(data_out), 
        .data_o(data_in)
    );

    rom u_rom(
        .addr_i(pc), 
        .data_o(instruction)
    );

    hackcore u_hackcore(
        .clk_i(clk),
        .reset_i(reset),
        .data_i(data_in),
        .inst_i(instruction),
        .data_o(data_out),
        .dmem_wr_en_o(dmem_en),
        .dmem_addr_o(dmem_addr),
        .pc_o(pc)
    );

endmodule