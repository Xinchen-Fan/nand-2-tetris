`timescale 1ns / 1ps

module Or8Way_tb();

    reg [7:0] in;
    wire out;

    Or8Way u_Or8Way(
        .in_i(in),
        .out_o(out)
    );

    initial begin
        in = 8'b0000_0000;
        $display("test running...");
        #10 
        in = 8'b0000_0000;
        #10 
        in = 8'b0000_0001;
        #10 
        in = 8'b1010_0000;
        #10 
        in = 8'b1101_1111;
        #10 
        in = 8'b0000_0000;
        #10 
        in = 8'b1111_1111;
        #1000 
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/Or8Way.vcd");
	    $dumpvars(0,Or8Way_tb);
	end

endmodule