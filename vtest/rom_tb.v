`timescale 1ns / 1ps

module rom_tb();

    reg [14:0] addr;
    wire [15:0] data;

    rom u_rom(
        .addr_i(addr),
        .data_o(data)
    );

    initial begin
        addr = 15'b0;
        $display("test running...");
        #10 addr = 15'd0;
        #10 addr = 15'd1;
        #10 addr = 15'd2;
        #10 addr = 15'd3;
        #10 addr = 15'd4;
        #10 addr = 15'd5;
        #10 addr = 15'd6;
        #100
        $finish;
    end

    initial begin
        $readmemb("vtest/hack_program/Add.hack", u_rom._rom);
    end

    initial begin
        $dumpfile("vtest/dumpfile/rom.vcd");
	    $dumpvars(0,rom_tb);
	end

endmodule