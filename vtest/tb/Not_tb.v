`timescale 1ns / 1ps

module Not_tb();

    reg in;
    wire out;

    Not u_Not(
        .in_i(in),
        .out_o(out)
    );


    initial begin
        in = 0;
        $display("test running...");
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #1000 
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/Not.vcd");
	    $dumpvars(0,Not_tb);
	end

endmodule