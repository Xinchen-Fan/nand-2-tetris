`timescale 1ns / 1ps

module RAM8_tb();

    reg clk;
    reg [15:0] din;
    reg load;
    reg [2:0] address;
    wire [15:0] dout;

    RAM8 u_RAM8(
        .clk_i(clk),
        .in_i(din),
        .load_i(load),
        .address_i(address),
        .out_o(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0; din = 16'b0; load = 1'b1; address = 3'b000;
        $display("test running...");
        #3 din = 0; address = 3'b000;
        #3 din = 0; address = 3'b000;
        #3 din = 0; address = 3'b000;
        #3 din = 0; address = 3'b000;
        #3 din = -32123; address = 3'b001;
        #3 din = -32123; address = 3'b001;
        #3 din = -32123; address = 3'b001;
        #3 din = -32123; address = 3'b001;
        #3 din = -327; address = 3'b010;
        #3 din = -327; address = 3'b010;
        #3 din = -327; address = 3'b010;
        #3 din = -327; address = 3'b010;
        #3 din = 11111; address = 3'b011;
        #3 din = 11111; address = 3'b011;
        #3 din = 11111; address = 3'b011;
        #3 din = 11111; address = 3'b011;
        #3 din = 1; address = 3'b100;
        #3 din = 1; address = 3'b100;
        #3 din = 1; address = 3'b100;
        #3 din = 1; address = 3'b100;
        #3 din = 33; address = 3'b101;
        #3 din = 33; address = 3'b101;
        #3 din = 33; address = 3'b101;
        #3 din = 33; address = 3'b101;
        #3 din = -4096; address = 3'b110;
        #3 din = -4096; address = 3'b110;
        #3 din = -4096; address = 3'b110;
        #3 din = -4096; address = 3'b110;
        #3 din = 12345; address = 3'b111;
        #3 din = 12345; address = 3'b111;
        #3 din = 12345; address = 3'b111;
        #3 din = 12345; address = 3'b111;
        #3 din = 1'b1; load = 1'b0;
        #3 din = 0; address = 3'b000;
        #3 din = 0; address = 3'b000;
        #3 din = 0; address = 3'b000;
        #3 din = 0; address = 3'b000;
        #3 din = -32123; address = 3'b001;
        #3 din = -32123; address = 3'b001;
        #3 din = -32123; address = 3'b001;
        #3 din = -32123; address = 3'b001;
        #3 din = -327; address = 3'b010;
        #3 din = -327; address = 3'b010;
        #3 din = -327; address = 3'b010;
        #3 din = -327; address = 3'b010;
        #3 din = 11111; address = 3'b011;
        #3 din = 11111; address = 3'b011;
        #3 din = 11111; address = 3'b011;
        #3 din = 11111; address = 3'b011;
        #3 din = 1; address = 3'b100;
        #3 din = 1; address = 3'b100;
        #3 din = 1; address = 3'b100;
        #3 din = 1; address = 3'b100;
        #3 din = 33; address = 3'b101;
        #3 din = 33; address = 3'b101;
        #3 din = 33; address = 3'b101;
        #3 din = 33; address = 3'b101;
        #3 din = -4096; address = 3'b110;
        #3 din = -4096; address = 3'b110;
        #3 din = -4096; address = 3'b110;
        #3 din = -4096; address = 3'b110;
        #3 din = 12345; address = 3'b111;
        #3 din = 12345; address = 3'b111;
        #3 din = 12345; address = 3'b111;
        #3 din = 12345; address = 3'b111;
        #500
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/RAM8.vcd");
	    $dumpvars(0,RAM8_tb);
	end

endmodule