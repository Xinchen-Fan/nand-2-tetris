`timescale 1ns / 1ps

module Bit_tb();

    reg clk;
    reg din;
    reg load;
    wire dout;

    Bit u_Bit(
        .clk_i(clk),
        .in_i(din),
        .load_i(load),
        .out_o(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0; din = 1'b0; load = 1'b1;
        $display("test running...");
        #3 din = 1'b1;
        #3 din = 1'b1;
        #3 din = 1'b1;
        #3 din = 1'b0;
        #3 din = 1'b0;
        #3 din = 1'b0;
        #3 din = 1'b0;
        #3 din = 1'b1;
        #3 din = 1'b1;
        #3 din = 1'b1;
        #3 din = 1'b1;
        #3 din = 1'b0;
        #3 din = 1'b1;
        #3 din = 1'b0;
        #3 din = 1'b1;
        #3 din = 1'b0;
        #3 din = 1'b1; load = 1'b0;
        #3 din = 1'b1;
        #3 din = 1'b1;
        #3 din = 1'b0;
        #3 din = 1'b0;
        #3 din = 1'b0;
        #3 din = 1'b0;
        #3 din = 1'b1; load = 1'b1;
        #3 din = 1'b1;
        #3 din = 1'b1;
        #3 din = 1'b1;
        #3 din = 1'b0;
        #3 din = 1'b1;
        #3 din = 1'b0; 
        #3 din = 1'b1;
        #3 din = 1'b0;
        #1000 
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/Bit.vcd");
	    $dumpvars(0,Bit_tb);
	end

endmodule