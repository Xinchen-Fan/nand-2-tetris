module ram(

    input wire clk_i,
    input wire load_i,                   // write enable
    input wire [14:0] addr_i,    // addr
    input wire [15:0] data_i,
    output reg [15:0] data_o         // read data

    );

    // 32K(32768) ram 
    reg [15:0] _ram[0:32768-1];


    always @ (posedge clk_i) begin
        if (load_i == 1'b1) begin
            _ram[addr_i[14:0]] <= data_i;
        end
    end

    always @ (*) begin
        data_o = _ram[addr_i[14:0]];
    end

endmodule