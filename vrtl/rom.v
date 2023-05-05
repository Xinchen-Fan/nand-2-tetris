`include "defines.v"

module rom(
    input wire [`InstAddrWidth-1:0] addr_i,    // addr
    output wire [`InstWidth-1:0] data_o     // read data
    );

    // 32K rom (32768)
    reg [`InstWidth-1:0] _rom [0:`InstDepth-1];
    assign data_o = _rom[addr_i];


endmodule