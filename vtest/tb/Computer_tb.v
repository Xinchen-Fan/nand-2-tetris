`timescale 1ns / 1ps

module Computer_tb();

    reg clk;
    reg rst;

    Computer u_Computer(
        .clk(clk),
        .reset(rst)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0; rst = 1'b1;
        $display("test running...");
        #50 rst = 1'b0; u_Computer.u_ram._ram[0] = 16'd2; u_Computer.u_ram._ram[1] = 16'd3; 
        #500 rst = 1'b1;
        #50 rst = 1'b0; u_Computer.u_ram._ram[0] = 16'd566; u_Computer.u_ram._ram[1] = 16'd3; 
        #500 rst = 1'b1;
        #50 rst = 1'b0; u_Computer.u_ram._ram[0] = 16'd5; u_Computer.u_ram._ram[1] = 16'd5; 
        #500 rst = 1'b1;
        #100
        $finish;
    end

    initial begin
        $readmemb("vtest/program.hack", u_Computer.u_rom._rom);
    end

    initial begin
        $dumpfile("vtest/dumpfile/Computer.vcd");
	    $dumpvars(0,Computer_tb);
	end

endmodule