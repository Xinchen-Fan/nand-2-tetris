/* CPU

CHIP CPU {

    IN  inM[16],         // M value input  (M = contents of RAM[A])
        instruction[16], // Instruction for execution
        reset;           // Signals whether to re-start the current
                         // program (reset==1) or continue executing
                         // the current program (reset==0).

    OUT outM[16],        // M value output
        writeM,          // Write to M? 
        addressM[15],    // Address in data memory (of M)
        pc[15];          // address of next instruction


CPU u_CPU(
    .clk_i(),
    .reset_i(),
    .dmem_data_i(),
    .inst_i(),
    .dmem_data_o(),
    .write_en_o(),
    .dmem_addr_o(),
    .pc_o()
);


 */

 module CPU(
    input wire clk_i,
    input wire reset_i,
    input wire [15:0] dmem_data_i,
    input wire [15:0] inst_i,
    output wire [15:0] dmem_data_o,
    output wire write_en_o,
    output wire [14:0] dmem_addr_o,
    output wire [14:0] pc_o

);
    wire d1;
    wire d2;
    wire d3;
    wire j1;
    wire j2;
    wire j3;
    wire [15:0] alu_out_buf;
    wire [15:0] a_reg_in;
    wire [15:0] a_reg_out;
    wire [15:0] x_alu;
    wire [15:0] y_alu;
    wire ng_alu;
    wire zr_alu;
    wire jump;
    wire [15:0] pc_buf;
    assign d1 = inst_i[15] & inst_i[5];
    assign d2 = inst_i[15] & inst_i[4];
    assign d3 = inst_i[15] & inst_i[3];
    assign j1 = inst_i[15] & inst_i[2];
    assign j2 = inst_i[15] & inst_i[1];
    assign j3 = inst_i[15] & inst_i[0];
    assign write_en_o = d3;
    assign dmem_data_o = alu_out_buf;
    assign a_reg_load = (~inst_i[15]) | d1;
    assign dmem_addr_o = a_reg_out[14:0]; // get addressM
    assign jump = (j1 & ng_alu) | (j2 & zr_alu) | (j3 & (~ng_alu) & (~zr_alu));  // get jump 
    assign pc_o = pc_buf[14:0];
    

    ALU u_ALU(
        .x_i(x_alu), .y_i(y_alu),
        .zx_i(inst_i[11]), .nx_i(inst_i[10]), .zy_i(inst_i[9]), .ny_i(inst_i[8]),
        .f_i(inst_i[7]), .no_i(inst_i[6]), .out_o(alu_out_buf), .zr_o(zr_alu), .ng_o(ng_alu)
    );

    Mux16 u1_Mux16(.a_i(inst_i), .b_i(alu_out_buf), .sel_i(inst_i[15]), .out_o(a_reg_in)); // choose AReg input
    Register u_ARegister(.clk_i(clk_i), .in_i(a_reg_in), .load_i(a_reg_load), .out_o(a_reg_out)); // A-Register
    Register u_DRegister(.clk_i(clk_i), .in_i(alu_out_buf), .load_i(d2), .out_o(x_alu)); // D-Register
    Mux16 u2_Mux16(.a_i(a_reg_out), .b_i(dmem_data_i), .sel_i(inst_i[12]), .out_o(y_alu)); // choose ALU input
    PC u_PC(.clk_i(clk_i), .in_i(a_reg_out), .load_i(jump), .inc_i(~jump), .reset_i(reset_i), .out_o(pc_buf));

endmodule


