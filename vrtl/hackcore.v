/* CPU

    hackcore u_hackcore(
        .clk_i(),
        .reset_i(),
        .data_i(),
        .inst_i(),
        .data_o(),
        .dmem_wr_en_o(),
        .dmem_addr_o(),
        .pc_o()
    );

 */

`include "defines.v"

 module hackcore(
    input wire clk_i,
    input wire reset_i,
    input wire [`DataWidth-1:0] data_i,
    input wire [`InstWidth-1:0] inst_i,
    output wire [`DataWidth-1:0] data_o,
    output wire dmem_wr_en_o,
    output wire [`DataAddrWidth-1:0] dmem_addr_o,
    output wire [`InstAddrWidth-1:0] pc_o

);
    wire d1;
    wire d2;
    wire d3;
    wire j1;
    wire j2;
    wire j3;
    wire [`DataWidth-1:0] alu_out_buf;
    wire [`DataWidth-1:0] a_reg_in;
    wire [`DataWidth-1:0] a_reg_out;
    wire [`DataWidth-1:0] x_alu;
    wire [`DataWidth-1:0] y_alu;
    wire ng_alu;
    wire zr_alu;
    wire jump;
    wire [`DataWidth-1:0] pc_buf;
    assign d1 = inst_i[15] & inst_i[5];
    assign d2 = inst_i[15] & inst_i[4];
    assign d3 = inst_i[15] & inst_i[3];
    assign j1 = inst_i[15] & inst_i[2];
    assign j2 = inst_i[15] & inst_i[1];
    assign j3 = inst_i[15] & inst_i[0];
    assign dmem_wr_en_o = d3;
    assign data_o = alu_out_buf;
    assign a_reg_load = (~inst_i[15]) | d1;
    assign dmem_addr_o = a_reg_out[`DataAddrWidth-1:0]; // get addressM
    assign jump = (j1 & ng_alu) | (j2 & zr_alu) | (j3 & (~ng_alu) & (~zr_alu));  // get jump 
    assign pc_o = pc_buf[`InstAddrWidth-1:0];
    assign a_reg_in = inst_i[15] ? alu_out_buf : inst_i; // choose AReg input
    assign y_alu = inst_i[12] ? data_i : a_reg_out; // choose ALU input
    

    alu u_alu(
        .x_i(x_alu), .y_i(y_alu),
        .zx_i(inst_i[11]), .nx_i(inst_i[10]), .zy_i(inst_i[9]), .ny_i(inst_i[8]),
        .f_i(inst_i[7]), .no_i(inst_i[6]), .out_o(alu_out_buf), .zr_o(zr_alu), .ng_o(ng_alu)
    );

    // A-Register
    register #(.WIDTH(`DataWidth), .RESET_VAL(`ZeroWord)) u_Aregister(
        .clk_i(clk_i),
        .in_i(a_reg_in),
        .reset_i(reset),
        .load_i(a_reg_load),
        .out_o(a_reg_out)
    );

    // D-Register
    register #(.WIDTH(`DataWidth), .RESET_VAL(`ZeroWord)) u_Dregister(
        .clk_i(clk_i),
        .in_i(alu_out_buf),
        .reset_i(reset),
        .load_i(d2),
        .out_o(x_alu)
    );
    
    pc u_pc(
        .clk_i(clk_i), 
        .in_i(a_reg_out), 
        .load_i(jump), 
        .inc_i(~jump), 
        .reset_i(reset_i), 
        .out_o(pc_buf)
    );

endmodule


