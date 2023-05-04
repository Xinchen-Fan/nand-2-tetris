`timescale 1ns / 1ps

module DMux_tb();

    reg in;
    reg sel;
    wire a;
    wire b;

    DMux u_DMux(
        .in_i(in),
        .sel_i(sel),
        .a_o(a),
        .b_o(b)
    );

    initial begin
        in = 0;
        sel = 0;
        $display("test running...");
        #10 
        in = 0;sel = 0;
        #10 
        in = 1;sel = 0;
        #10 
        in = 0;sel = 1;
        #10 
        in = 1;sel = 1;
        #1000 
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/DMux.vcd");
	    $dumpvars(0,DMux_tb);
	end

endmodule