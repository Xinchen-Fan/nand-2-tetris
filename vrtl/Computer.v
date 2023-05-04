module Computer(
    input wire clk,
    input wire reset
);

    wire [14:0] pc;
    wire [15:0] instruction;
    wire dmem_en;
    wire [14:0] dmem_addr;
    wire [15:0] dmem_in;
    wire [15:0] dmem_out;

    ram u_ram(.clk_i(clk), .load_i(dmem_en), .addr_i(dmem_addr), .data_i(dmem_in), .data_o(dmem_out));
    rom u_rom(.addr_i(pc), .data_o(instruction));
    CPU u_CPU(
        .clk_i(clk),
        .reset_i(reset),
        .dmem_data_i(dmem_out),
        .inst_i(instruction),
        .dmem_data_o(dmem_in),
        .write_en_o(dmem_en),
        .dmem_addr_o(dmem_addr),
        .pc_o(pc)
    );

endmodule