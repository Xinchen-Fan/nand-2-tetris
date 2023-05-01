`timescale 1ns / 1ps

module DMux8Way_tb();

    reg in;
    reg [2:0] sel;
    wire a;
    wire b;
    wire c;
    wire d;
    wire e;
    wire f;
    wire g;
    wire h;

    DMux8Way u_DMux8Way(
        .in_i(in),
        .sel_i(sel),
        .a_o(a),
        .b_o(b),
        .c_o(c),
        .d_o(d),
        .e_o(e),
        .f_o(f),
        .g_o(g),
        .h_o(h)
    );

    initial begin
        in = 0;
        sel = 3'b000;
        $display("test running...");
        #10 in = 0;sel = 3'b000;
        #10 sel = 3'b001;
        #10 sel = 3'b010;
        #10 sel = 3'b011;
        #10 sel = 3'b100;
        #10 sel = 3'b101;
        #10 sel = 3'b110;
        #10 sel = 3'b111;
        #10 in = 1;sel = 3'b000;
        #10 sel = 3'b001;
        #10 sel = 3'b010;
        #10 sel = 3'b011;
        #10 sel = 3'b100;
        #10 sel = 3'b101;
        #10 sel = 3'b110;
        #10 sel = 3'b111;
        #1000 
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/DMux8Way.vcd");
	    $dumpvars(0,DMux8Way_tb);
	end

endmodule