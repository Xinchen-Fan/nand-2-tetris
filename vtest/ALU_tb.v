`timescale 1ns / 1ps

module ALU_tb();
    reg [15:0] in_x;
    reg [15:0] in_y;
    reg z_x;
    reg nx;
    reg z_y;
    reg ny;
    reg f;
    reg no;
    wire [15:0] out;
    wire zr;
    wire ng;

    ALU u_ALU(
        .x_i(in_x),
        .y_i(in_y),
        .zx_i(z_x),
        .nx_i(nx),
        .zy_i(z_y),
        .ny_i(ny),
        .f_i(f),
        .no_i(no),
        .out_o(out),
        .zr_o(zr),
        .ng_o(ng)
    );

    initial begin
        in_x=16'b0000000000000000;in_y=16'b1111111111111111;
        z_x=0;nx=0;z_y=0;ny=0;f=0;no=0;
        $display("test running...");
        #10 z_x=1;nx=0;z_y=1;ny=0;f=1;no=0;
        #10 z_x=1;nx=1;z_y=1;ny=1;f=1;no=1;
        #10 z_x=1;nx=1;z_y=1;ny=0;f=1;no=0;
        #10 z_x=0;nx=0;z_y=1;ny=1;f=0;no=0;
        #10 z_x=1;nx=1;z_y=0;ny=0;f=0;no=0;
        #10 z_x=0;nx=0;z_y=1;ny=1;f=0;no=1;
        #10 z_x=1;nx=1;z_y=0;ny=0;f=0;no=1;
        #10 z_x=0;nx=0;z_y=1;ny=1;f=1;no=1;
        #10 z_x=1;nx=1;z_y=0;ny=0;f=1;no=1;
        #10 z_x=0;nx=1;z_y=1;ny=1;f=1;no=1;
        #10 z_x=1;nx=1;z_y=0;ny=1;f=1;no=1;
        #10 z_x=0;nx=0;z_y=1;ny=1;f=1;no=0;
        #10 z_x=1;nx=1;z_y=0;ny=0;f=1;no=0;
        #10 z_x=0;nx=0;z_y=0;ny=0;f=1;no=0;
        #10 z_x=0;nx=1;z_y=0;ny=0;f=1;no=1;
        #10 z_x=0;nx=0;z_y=0;ny=1;f=1;no=1;
        #10 z_x=0;nx=0;z_y=0;ny=0;f=0;no=0;
        #10 z_x=0;nx=1;z_y=0;ny=1;f=0;no=1;
        #10 in_x=16'b0000000000010001;in_y=16'b0000000000000011;
        z_x=0;nx=0;z_y=0;ny=0;f=0;no=0;
        #30 z_x=1;nx=0;z_y=1;ny=0;f=1;no=0;
        #10 z_x=1;nx=1;z_y=1;ny=1;f=1;no=1;
        #10 z_x=1;nx=1;z_y=1;ny=0;f=1;no=0;
        #10 z_x=0;nx=0;z_y=1;ny=1;f=0;no=0;
        #10 z_x=1;nx=1;z_y=0;ny=0;f=0;no=0;
        #10 z_x=0;nx=0;z_y=1;ny=1;f=0;no=1;
        #10 z_x=1;nx=1;z_y=0;ny=0;f=0;no=1;
        #10 z_x=0;nx=0;z_y=1;ny=1;f=1;no=1;
        #10 z_x=1;nx=1;z_y=0;ny=0;f=1;no=1;
        #10 z_x=0;nx=1;z_y=1;ny=1;f=1;no=1;
        #10 z_x=1;nx=1;z_y=0;ny=1;f=1;no=1;
        #10 z_x=0;nx=0;z_y=1;ny=1;f=1;no=0;
        #10 z_x=1;nx=1;z_y=0;ny=0;f=1;no=0;
        #10 z_x=0;nx=0;z_y=0;ny=0;f=1;no=0;
        #10 z_x=0;nx=1;z_y=0;ny=0;f=1;no=1;
        #10 z_x=0;nx=0;z_y=0;ny=1;f=1;no=1;
        #10 z_x=0;nx=0;z_y=0;ny=0;f=0;no=0;
        #10 z_x=0;nx=1;z_y=0;ny=1;f=0;no=1;
        #1000 
        $finish;
    end

    initial begin
        $dumpfile("vtest/dumpfile/ALU.vcd");
	    $dumpvars(0,ALU_tb);
	end

endmodule

// |        x         |        y         |zx |nx |zy |ny | f |no |       out        |zr |ng |
// | 0000000000000000 | 1111111111111111 | 1 | 0 | 1 | 0 | 1 | 0 | 0000000000000000 | 1 | 0 |
// | 0000000000000000 | 1111111111111111 | 1 | 1 | 1 | 1 | 1 | 1 | 0000000000000001 | 0 | 0 |
// | 0000000000000000 | 1111111111111111 | 1 | 1 | 1 | 0 | 1 | 0 | 1111111111111111 | 0 | 1 |
// | 0000000000000000 | 1111111111111111 | 0 | 0 | 1 | 1 | 0 | 0 | 0000000000000000 | 1 | 0 |
// | 0000000000000000 | 1111111111111111 | 1 | 1 | 0 | 0 | 0 | 0 | 1111111111111111 | 0 | 1 |
// | 0000000000000000 | 1111111111111111 | 0 | 0 | 1 | 1 | 0 | 1 | 1111111111111111 | 0 | 1 |
// | 0000000000000000 | 1111111111111111 | 1 | 1 | 0 | 0 | 0 | 1 | 0000000000000000 | 1 | 0 |
// | 0000000000000000 | 1111111111111111 | 0 | 0 | 1 | 1 | 1 | 1 | 0000000000000000 | 1 | 0 |
// | 0000000000000000 | 1111111111111111 | 1 | 1 | 0 | 0 | 1 | 1 | 0000000000000001 | 0 | 0 |
// | 0000000000000000 | 1111111111111111 | 0 | 1 | 1 | 1 | 1 | 1 | 0000000000000001 | 0 | 0 |
// | 0000000000000000 | 1111111111111111 | 1 | 1 | 0 | 1 | 1 | 1 | 0000000000000000 | 1 | 0 |
// | 0000000000000000 | 1111111111111111 | 0 | 0 | 1 | 1 | 1 | 0 | 1111111111111111 | 0 | 1 |
// | 0000000000000000 | 1111111111111111 | 1 | 1 | 0 | 0 | 1 | 0 | 1111111111111110 | 0 | 1 |
// | 0000000000000000 | 1111111111111111 | 0 | 0 | 0 | 0 | 1 | 0 | 1111111111111111 | 0 | 1 |
// | 0000000000000000 | 1111111111111111 | 0 | 1 | 0 | 0 | 1 | 1 | 0000000000000001 | 0 | 0 |
// | 0000000000000000 | 1111111111111111 | 0 | 0 | 0 | 1 | 1 | 1 | 1111111111111111 | 0 | 1 |
// | 0000000000000000 | 1111111111111111 | 0 | 0 | 0 | 0 | 0 | 0 | 0000000000000000 | 1 | 0 |
// | 0000000000000000 | 1111111111111111 | 0 | 1 | 0 | 1 | 0 | 1 | 1111111111111111 | 0 | 1 |
// | 0000000000010001 | 0000000000000011 | 1 | 0 | 1 | 0 | 1 | 0 | 0000000000000000 | 1 | 0 |
// | 0000000000010001 | 0000000000000011 | 1 | 1 | 1 | 1 | 1 | 1 | 0000000000000001 | 0 | 0 |
// | 0000000000010001 | 0000000000000011 | 1 | 1 | 1 | 0 | 1 | 0 | 1111111111111111 | 0 | 1 |
// | 0000000000010001 | 0000000000000011 | 0 | 0 | 1 | 1 | 0 | 0 | 0000000000010001 | 0 | 0 |
// | 0000000000010001 | 0000000000000011 | 1 | 1 | 0 | 0 | 0 | 0 | 0000000000000011 | 0 | 0 |
// | 0000000000010001 | 0000000000000011 | 0 | 0 | 1 | 1 | 0 | 1 | 1111111111101110 | 0 | 1 |
// | 0000000000010001 | 0000000000000011 | 1 | 1 | 0 | 0 | 0 | 1 | 1111111111111100 | 0 | 1 |
// | 0000000000010001 | 0000000000000011 | 0 | 0 | 1 | 1 | 1 | 1 | 1111111111101111 | 0 | 1 |
// | 0000000000010001 | 0000000000000011 | 1 | 1 | 0 | 0 | 1 | 1 | 1111111111111101 | 0 | 1 |
// | 0000000000010001 | 0000000000000011 | 0 | 1 | 1 | 1 | 1 | 1 | 0000000000010010 | 0 | 0 |
// | 0000000000010001 | 0000000000000011 | 1 | 1 | 0 | 1 | 1 | 1 | 0000000000000100 | 0 | 0 |
// | 0000000000010001 | 0000000000000011 | 0 | 0 | 1 | 1 | 1 | 0 | 0000000000010000 | 0 | 0 |
// | 0000000000010001 | 0000000000000011 | 1 | 1 | 0 | 0 | 1 | 0 | 0000000000000010 | 0 | 0 |
// | 0000000000010001 | 0000000000000011 | 0 | 0 | 0 | 0 | 1 | 0 | 0000000000010100 | 0 | 0 |
// | 0000000000010001 | 0000000000000011 | 0 | 1 | 0 | 0 | 1 | 1 | 0000000000001110 | 0 | 0 |
// | 0000000000010001 | 0000000000000011 | 0 | 0 | 0 | 1 | 1 | 1 | 1111111111110010 | 0 | 1 |
// | 0000000000010001 | 0000000000000011 | 0 | 0 | 0 | 0 | 0 | 0 | 0000000000000001 | 0 | 0 |
// | 0000000000010001 | 0000000000000011 | 0 | 1 | 0 | 1 | 0 | 1 | 0000000000010011 | 0 | 0 |