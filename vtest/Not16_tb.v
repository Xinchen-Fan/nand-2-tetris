`timescale 1ns / 1ps

module Not16_tb();

    reg [15:0] in;
    wire [15:0] out;

    Not16 u_Not16(
        .in_i(in),
        .out_o(out)
    );

    initial begin
        in = 16'b0000_0000_0000_0000;
        $display("test running...");
        #10 
        in = 16'b1111_1111_1111_1111;
        #10 
        in = 16'b1010_1010_1010_1010;
        #10 
        in = 16'b0101_0101_0101_0101;
        #10 
        in = 16'b0011_1011_1111_0001;
        #1000 
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/Not16.vcd");
	    $dumpvars(0,Not16_tb);
	end

endmodule