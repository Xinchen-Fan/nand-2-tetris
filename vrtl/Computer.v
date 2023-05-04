module Computer(
    input wire clk,
    input wire reset
);

    wire [14:0] pc;
    wire [15:0] instruction;
    wire dmem_en;
    wire [14:0] dmem_addr;
    wire [15:0] data_out;
    wire [15:0] data_in;

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

    CPU u_CPU(
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