/* ram

ram u_ram(
    .clk_i(),
    .reset_i(),
    .load_i(),
    .addr_i(),
    .data_i(),
    .data_o()
);

*/


module ram(

    input wire clk_i,
    input wire reset_i,
    input wire load_i,           // write enable
    input wire [14:0] addr_i,    // addr
    input wire [15:0] data_i,
    output wire [15:0] data_o         // read data

    );

    // 32K(32768) ram 
    reg [15:0] _ram [0:32768-1];


    always @ (posedge clk_i) begin
        if (load_i == 1'b1) begin
            _ram[addr_i] <= data_i;
        end
    end

    assign data_o = reset_i ? 16'b0 : _ram[addr_i];

endmodule