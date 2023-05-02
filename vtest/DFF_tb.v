`timescale 1ns / 1ps

module DFF_tb();

    reg clk;
    reg din;
    wire dout;

    DFF u_DFF(
        .clk_i(clk),
        .din_i(din),
        .dout_o(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;din = 1'b0;
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
        #1000 
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/DFF.vcd");
	    $dumpvars(0,DFF_tb);
	end

endmodule