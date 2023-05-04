`timescale 1ns / 1ps

module DMux4Way_tb();

    reg in;
    reg [1:0] sel;
    wire a;
    wire b;
    wire c;
    wire d;

    DMux4Way u_DMux4Way(
        .in_i(in),
        .sel_i(sel),
        .a_o(a),
        .b_o(b),
        .c_o(c),
        .d_o(d)
    );

    initial begin
        in = 0;
        sel = 2'b00;
        $display("test running...");
        #10 
        in = 0;sel = 2'b00;
        #10 
        in = 0;sel = 2'b01;
        #10 
        in = 0;sel = 2'b10;
        #10 
        in = 0;sel = 2'b11;
        #10 
        in = 1;sel = 2'b00;
        #10 
        in = 1;sel = 2'b01;
        #10 
        in = 1;sel = 2'b10;
        #10 
        in = 1;sel = 2'b11;
        #1000 
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/DMux4Way.vcd");
	    $dumpvars(0,DMux4Way_tb);
	end

endmodule