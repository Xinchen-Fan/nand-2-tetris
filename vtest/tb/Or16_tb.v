`timescale 1ns / 1ps

module Or16_tb();

    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] out;

    Or16 u_Or16(
        .a_i(a),
        .b_i(b),
        .out_o(out)
    );

    initial begin
        a = 16'b0000_0000_0000_0000;
        b = 16'b0000_0000_0000_0000;
        $display("test running...");
        #10
        a = 16'b0000_0000_0000_0000;
        b = 16'b0000_0000_0000_0000;
        #10 
        a = 16'b1111_1111_1111_1111;
        b = 16'b0000_0000_0000_0000;
        #10 
        a = 16'b0000_0000_0000_0000;
        b = 16'b1111_1111_1111_1111;
        #10 
        a = 16'b1111_1111_1111_1111;
        b = 16'b1111_1111_1111_1111;
        #10 
        a = 16'b1010_1010_1010_1010;
        b = 16'b0011_1011_1111_0001;
        #1000 
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/Or16.vcd");
	    $dumpvars(0,Or16_tb);
	end

endmodule