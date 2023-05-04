`timescale 1ns / 1ps

module PC_tb();

    reg clk;
    reg [15:0] din;
    reg load;
    reg inc;
    reg reset;
    wire [15:0] dout;

    PC u_PC(
        .clk_i(clk),
        .in_i(din),
        .load_i(load),
        .inc_i(inc),
        .reset_i(reset),
        .out_o(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0; din = 16'b0; load = 1'b0; inc = 1'b0; reset = 1'b0;
        $display("test running...");
        #3 din = -32123; reset = 1'b0; load = 1'b0; inc = 1'b0;
        #3 din = -32123; reset = 1'b0; load = 1'b0; inc = 1'b0;
        #3 din = -32123; reset = 1'b0; load = 1'b0; inc = 1'b0;
        #3 din = 11111; reset = 1'b0; load = 1'b0; inc = 1'b1;
        #3 din = 11111; reset = 1'b0; load = 1'b0; inc = 1'b1;
        #3 din = 11111; reset = 1'b0; load = 1'b0; inc = 1'b1;
        #3 din = 11111; reset = 1'b0; load = 1'b1; inc = 1'b1;
        #3 din = 12345; reset = 1'b0; load = 1'b1; inc = 1'b1;
        #3 din = 12345; reset = 1'b0; load = 1'b1; inc = 1'b1;
        #3 din = 12345; reset = 1'b0; load = 1'b0; inc = 1'b1;
        #3 din = 8; reset = 1'b0; load = 1'b0; inc = 1'b1;
        #3 din = 8; reset = 1'b0; load = 1'b0; inc = 1'b1;
        #3 din = 8; reset = 1'b0; load = 1'b1; inc = 1'b0;
        #3 din = 32767; reset = 1'b0; load = 1'b1; inc = 1'b0;
        #3 din = 32767; reset = 1'b0; load = 1'b1; inc = 1'b0;
        #3 din = 32767; reset = 1'b1; load = 1'b0; inc = 1'b0;
        #3 din = 1'b1; reset = 1'b1; load = 1'b0; inc = 1'b0;
        #3 din = 1'b1; reset = 1'b1; load = 1'b0; inc = 1'b0;
        #3 din = 1'b1; reset = 1'b1; load = 1'b0; inc = 1'b0;
        #3 din = 1'b0; reset = 1'b1; load = 1'b1; inc = 1'b1;
        #3 din = 1'b0; reset = 1'b1; load = 1'b1; inc = 1'b1;
        #3 din = 1'b0; reset = 1'b1; load = 1'b1; inc = 1'b1;
        #3 din = 1'b0; reset = 1'b1; load = 1'b1; inc = 1'b1;
        #3 din = 1'b1; reset = 1'b1; load = 1'b1; inc = 1'b0;
        #3 din = -16385; reset = 1'b1; load = 1'b1; inc = 1'b0;
        #3 din = -16385; reset = 1'b1; load = 1'b1; inc = 1'b0;
        #3 din = -16385; reset = 1'b0; load = 1'b0; inc = 1'b1;
        #3 din = -16385; reset = 1'b0; load = 1'b0; inc = 1'b1;
        #3 din = 0; reset = 1'b0; load = 1'b0; inc = 1'b1;
        #3 din = 0; reset = 1'b0; load = 1'b0; inc = 1'b1;
        #3 din = -4097; reset = 1'b0; load = 1'b0; inc = 1'b0;
        #3 din = -4097; reset = 1'b0; load = 1'b0; inc = 1'b0;
        #3 din = -4097; reset = 1'b0; load = 1'b0; inc = 1'b0;
        #3 din = -4097; reset = 1'b0; load = 1'b0; inc = 1'b0;
        #3 din = -257;
        #3 din = -257;
        #3 din = -257;
        #3 din = -257;
        #3 din = -2;
        #3 din = -2;
        #3 din = -2;
        #3 din = -2;
        #1000 
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/PC.vcd");
	    $dumpvars(0,PC_tb);
	end

endmodule