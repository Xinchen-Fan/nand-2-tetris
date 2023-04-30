`timescale 1ns / 1ps

module Nand_tb();

    reg a;
    reg b;
    wire out;

    Nand u_Nand(
        .a_i(a),
        .b_i(b),
        .out_o(out)
    );


    initial begin
        a = 0;
        b = 0;
        $display("test running...");
        #10 
        a = 0;
        b = 0;
        #10 
        a = 0;
        b = 1;
        #10 
        a = 1;
        b = 0;
        #10 
        a = 1;
        b = 1;
        #1000 
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/Nand.vcd");
	    $dumpvars(0,Nand_tb);
	end

endmodule