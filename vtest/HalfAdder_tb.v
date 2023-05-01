`timescale 1ns / 1ps

module HalfAdder_tb();

    reg a;
    reg b;
    wire sum;
    wire carry;

    HalfAdder u_HalfAdder(
        .a_i(a),
        .b_i(b),
        .sum_o(sum),
        .carry_o(carry)
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
        $dumpfile("vtest/dumpfile/HalfAdder.vcd");
	    $dumpvars(0,HalfAdder_tb);
	end

endmodule