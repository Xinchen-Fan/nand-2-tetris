`timescale 1ns / 1ps

module FullAdder_tb();

    reg a;
    reg b;
    reg c;
    wire sum;
    wire carry;

    FullAdder u_FullAdder(
        .a_i(a),
        .b_i(b),
        .c_i(c),
        .sum_o(sum),
        .carry_o(carry)
    );


    initial begin
        a = 0;b = 0;c = 0;
        $display("test running...");
        #10 a = 0;b = 0;c = 0;
        #10 a = 0;b = 0;c = 1;
        #10 a = 0;b = 1;c = 0;
        #10 a = 0;b = 1;c = 1;
        #10 a = 1;b = 0;c = 0;
        #10 a = 1;b = 0;c = 1;
        #10 a = 1;b = 1;c = 0;
        #10 a = 1;b = 1;c = 1;
        #1000 
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/FullAdder.vcd");
	    $dumpvars(0,FullAdder_tb);
	end

endmodule