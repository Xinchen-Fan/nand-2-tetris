`timescale 1ns / 1ps

module Register_tb();

    reg clk;
    reg [15:0] din;
    reg load;
    wire [15:0] dout;

    Register u_Register(
        .clk_i(clk),
        .in_i(din),
        .load_i(load),
        .out_o(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0; din = 16'b0; load = 1'b1;
        $display("test running...");
        #3 din = -32123;
        #3 din = -32123;
        #3 din = -32123;
        #3 din = 11111;
        #3 din = 11111;
        #3 din = 11111;
        #3 din = 11111;
        #3 din = 12345;
        #3 din = 12345;
        #3 din = 12345;
        #3 din = 8;
        #3 din = 8;
        #3 din = 8;
        #3 din = 32767;
        #3 din = 32767;
        #3 din = 32767;
        #3 din = 1'b1; load = 1'b0;
        #3 din = 1'b1;
        #3 din = 1'b1;
        #3 din = 1'b0;
        #3 din = 1'b0;
        #3 din = 1'b0;
        #3 din = 1'b0;
        #3 din = 1'b1; load = 1'b1;
        #3 din = -16385;
        #3 din = -16385;
        #3 din = -16385;
        #3 din = -16385;
        #3 din = 0;
        #3 din = 0; 
        #3 din = -4097;
        #3 din = -4097;
        #3 din = -4097;
        #3 din = -4097;
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
        $dumpfile("vtest/dumpfile/Register.vcd");
	    $dumpvars(0,Register_tb);
	end

endmodule