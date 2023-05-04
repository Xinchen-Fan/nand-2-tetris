`timescale 1ns / 1ps

module RAM512_tb();

    reg clk;
    reg [15:0] din;
    reg load;
    reg [8:0] address;
    wire [15:0] dout;

    RAM512 u_RAM512(
        .clk_i(clk),
        .in_i(din),
        .load_i(load),
        .address_i(address),
        .out_o(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0; din = 16'b0; load = 1'b1; address = 9'b000000000;
        $display("test running...");
        #3 din = 0; address = 9'b000000000;
        #3 din = 0; address = 9'b000000000;
        #3 din = 0; address = 9'b000000000;
        #3 din = 0; address = 9'b000000000;
        #3 din = -32123; address = 9'b001001001;
        #3 din = -32123; address = 9'b001001001;
        #3 din = -32123; address = 9'b001001001;
        #3 din = -32123; address = 9'b001001001;
        #3 din = -327; address = 9'b010010010;
        #3 din = -327; address = 9'b010010010;
        #3 din = -327; address = 9'b010010010;
        #3 din = -327; address = 9'b010010010;
        #3 din = 11111; address = 9'b011011011;
        #3 din = 11111; address = 9'b011011011;
        #3 din = 11111; address = 9'b011011011;
        #3 din = 11111; address = 9'b011011011;
        #3 din = 1; address = 9'b100100100;
        #3 din = 1; address = 9'b100100100;
        #3 din = 1; address = 9'b100100100;
        #3 din = 1; address = 9'b100100100;
        #3 din = 33; address = 9'b101101101;
        #3 din = 33; address = 9'b101101101;
        #3 din = 33; address = 9'b101101101;
        #3 din = 33; address = 9'b101101101;
        #3 din = -4096; address = 9'b110110110;
        #3 din = -4096; address = 9'b110110110;
        #3 din = -4096; address = 9'b110110110;
        #3 din = -4096; address = 9'b110110110;
        #3 din = 12345; address = 9'b111111111;
        #3 din = 12345; address = 9'b111111111;
        #3 din = 12345; address = 9'b111111111;
        #3 din = 12345; address = 9'b111111111;
        #3 din = 1'b1; load = 1'b0;
        #3 din = 0; address = 9'b000000000;
        #3 din = 0; address = 9'b000000000;
        #3 din = 0; address = 9'b000000000;
        #3 din = 0; address = 9'b000000000;
        #3 din = -32123; address = 9'b001001001;
        #3 din = -32123; address = 9'b001001001;
        #3 din = -32123; address = 9'b001001001;
        #3 din = -32123; address = 9'b001001001;
        #3 din = -327; address = 9'b010010010;
        #3 din = -327; address = 9'b010010010;
        #3 din = -327; address = 9'b010010010;
        #3 din = -327; address = 9'b010010010;
        #3 din = 11111; address = 9'b011011011;
        #3 din = 11111; address = 9'b011011011;
        #3 din = 11111; address = 9'b011011011;
        #3 din = 11111; address = 9'b011011011;
        #3 din = 1; address = 9'b100100100;
        #3 din = 1; address = 9'b100100100;
        #3 din = 1; address = 9'b100100100;
        #3 din = 1; address = 9'b100100100;
        #3 din = 33; address = 9'b101101101;
        #3 din = 33; address = 9'b101101101;
        #3 din = 33; address = 9'b101101101;
        #3 din = 33; address = 9'b101101101;
        #3 din = -4096; address = 9'b110110110;
        #3 din = -4096; address = 9'b110110110;
        #3 din = -4096; address = 9'b110110110;
        #3 din = -4096; address = 9'b110110110;
        #3 din = 12345; address = 9'b111111111;
        #3 din = 12345; address = 9'b111111111;
        #3 din = 12345; address = 9'b111111111;
        #3 din = 12345; address = 9'b111111111;
        #500
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/RAM512.vcd");
	    $dumpvars(0,RAM512_tb);
	end

endmodule