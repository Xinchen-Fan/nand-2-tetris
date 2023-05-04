module rom(
    input wire [14:0] addr_i,    // addr
    output reg [15:0] data_o     // read data
    );

    // 32K rom (32768)
    reg [15:0] _rom [0:32768-1];

    always @ (*) begin
        data_o = _rom[addr_i[14:0]];
    end

endmodule