`timescale 1ns / 1ps

module Mux_tb();

    reg a;
    reg b;
    reg sel;
    wire out;

    Mux u_Mux(
        .a_i(a),
        .b_i(b),
        .sel_i(sel),
        .out_o(out)
    );


    initial begin
        a = 0;
        b = 0;
        sel = 0;
        $display("test running...");
        #10 
        a = 0;b = 0;sel = 0;
        #10 
        a = 0;b = 1;sel = 0;
        #10 
        a = 1;b = 0;sel = 0;
        #10 
        a = 1;b = 1;sel = 0;
        #10 
        a = 0;b = 0;sel = 1;
        #10 
        a = 0;b = 1;sel = 1;
        #10 
        a = 1;b = 0;sel = 1;
        #10 
        a = 1;b = 1;sel = 1;
        #1000 
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/Mux.vcd");
	    $dumpvars(0,Mux_tb);
	end

endmodule