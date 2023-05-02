`timescale 1ns / 1ps

module RAM64_tb();

    reg clk;
    reg [15:0] din;
    reg load;
    reg [5:0] address;
    wire [15:0] dout;

    RAM64 u_RAM64(
        .clk_i(clk),
        .in_i(din),
        .load_i(load),
        .address_i(address),
        .out_o(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0; din = 16'b0; load = 1'b1; address = 6'b000000;
        $display("test running...");
        #3 din = 0; address = 6'b000000;
        #3 din = 0; address = 6'b000000;
        #3 din = 0; address = 6'b000000;
        #3 din = 0; address = 6'b000000;
        #3 din = -32123; address = 6'b001001;
        #3 din = -32123; address = 6'b001001;
        #3 din = -32123; address = 6'b001001;
        #3 din = -32123; address = 6'b001001;
        #3 din = -327; address = 6'b010010;
        #3 din = -327; address = 6'b010010;
        #3 din = -327; address = 6'b010010;
        #3 din = -327; address = 6'b010010;
        #3 din = 11111; address = 6'b011011;
        #3 din = 11111; address = 6'b011011;
        #3 din = 11111; address = 6'b011011;
        #3 din = 11111; address = 6'b011011;
        #3 din = 1; address = 6'b100100;
        #3 din = 1; address = 6'b100100;
        #3 din = 1; address = 6'b100100;
        #3 din = 1; address = 6'b100100;
        #3 din = 33; address = 6'b101101;
        #3 din = 33; address = 6'b101101;
        #3 din = 33; address = 6'b101101;
        #3 din = 33; address = 6'b101101;
        #3 din = -4096; address = 6'b110110;
        #3 din = -4096; address = 6'b110110;
        #3 din = -4096; address = 6'b110110;
        #3 din = -4096; address = 6'b110110;
        #3 din = 12345; address = 6'b111111;
        #3 din = 12345; address = 6'b111111;
        #3 din = 12345; address = 6'b111111;
        #3 din = 12345; address = 6'b111111;
        #3 din = 1'b1; load = 1'b0;
        #3 din = 0; address = 6'b000000;
        #3 din = 0; address = 6'b000000;
        #3 din = 0; address = 6'b000000;
        #3 din = 0; address = 6'b000000;
        #3 din = -32123; address = 6'b001001;
        #3 din = -32123; address = 6'b001001;
        #3 din = -32123; address = 6'b001001;
        #3 din = -32123; address = 6'b001001;
        #3 din = -327; address = 6'b010010;
        #3 din = -327; address = 6'b010010;
        #3 din = -327; address = 6'b010010;
        #3 din = -327; address = 6'b010010;
        #3 din = 11111; address = 6'b011011;
        #3 din = 11111; address = 6'b011011;
        #3 din = 11111; address = 6'b011011;
        #3 din = 11111; address = 6'b011011;
        #3 din = 1; address = 6'b100100;
        #3 din = 1; address = 6'b100100;
        #3 din = 1; address = 6'b100100;
        #3 din = 1; address = 6'b100100;
        #3 din = 33; address = 6'b101101;
        #3 din = 33; address = 6'b101101;
        #3 din = 33; address = 6'b101101;
        #3 din = 33; address = 6'b101101;
        #3 din = -4096; address = 6'b110110;
        #3 din = -4096; address = 6'b110110;
        #3 din = -4096; address = 6'b110110;
        #3 din = -4096; address = 6'b110110;
        #3 din = 12345; address = 6'b111111;
        #3 din = 12345; address = 6'b111111;
        #3 din = 12345; address = 6'b111111;
        #3 din = 12345; address = 6'b111111;
        #500
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/RAM64.vcd");
	    $dumpvars(0,RAM64_tb);
	end

endmodule