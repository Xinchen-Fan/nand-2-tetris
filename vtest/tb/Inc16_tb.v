`timescale 1ns / 1ps

module Inc16_tb();

    reg [15:0] in;
    wire [15:0] out;

    Inc16 u_Inc16(
        .in_i(in),
        .out_o(out)
    );

    initial begin
        in = 16'b0000_0000_0000_0000;
        $display("test running...");
        #10 in = 16'b0000_0000_0000_0000;
        #10 in = 16'b1111_1111_1111_1111;
        #10 in = 16'b1010_1010_1010_1010;
        #10 in = 16'b0011_1011_1111_0001;
        #10 in = 16'b0001_0010_0011_0100;
        #10 in = 16'b1001_1000_0111_0110;
        #1000 
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/Inc16.vcd");
	    $dumpvars(0,Inc16_tb);
	end

endmodule