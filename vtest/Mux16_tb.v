`timescale 1ns / 1ps

module Mux16_tb();

    reg [15:0] a;
    reg [15:0] b;
    reg sel;
    wire [15:0] out;

    Mux16 u_Mux16(
        .a_i(a),
        .b_i(b),
        .sel_i(sel),
        .out_o(out)
    );

    initial begin
        a = 16'b0000_0000_0000_0000;
        b = 16'b0000_0000_0000_0000;sel = 1'b0;
        $display("test running...");
        #10
        a = 16'b0000_0000_0000_0000;
        b = 16'b0000_0000_0000_0000;sel = 1'b0;
        #10 
        a = 16'b1111_1111_1111_1111;
        b = 16'b0000_0000_0000_0000;sel = 1'b0;
        #10 
        a = 16'b0000_0000_0000_0000;
        b = 16'b1111_1111_1111_1111;sel = 1'b0;
        #10 
        a = 16'b1111_1111_1111_1111;
        b = 16'b1111_1111_1111_1111;sel = 1'b0;
        #10 
        a = 16'b1010_1010_1010_1010;
        b = 16'b0011_1011_1111_0001;sel = 1'b0;
        #10
        a = 16'b0000_0000_0000_0000;
        b = 16'b0000_0000_0000_0000;sel = 1'b1;
        #10 
        a = 16'b1111_1111_1111_1111;
        b = 16'b0000_0000_0000_0000;sel = 1'b1;
        #10 
        a = 16'b0000_0000_0000_0000;
        b = 16'b1111_1111_1111_1111;sel = 1'b1;
        #10 
        a = 16'b1111_1111_1111_1111;
        b = 16'b1111_1111_1111_1111;sel = 1'b1;
        #10 
        a = 16'b1010_1010_1010_1010;
        b = 16'b0011_1011_1111_0001;sel = 1'b1;
        #1000 
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/Mux16.vcd");
	    $dumpvars(0,Mux16_tb);
	end

endmodule