// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// Ram[2] = 0
@R2
M=0

// if R0 == 0: r2 = 0 
@R0
D=M
@END
D;JEQ

// if R1 == 0: r2 = 0
@R1
D=M
@END
D;JEQ

// n = RAM[1]
@R1
D=M
@n 
M=D

// k = RAM[0]
@R0
D=M
@k
M=D

// i = 1
@i 
M=1

(LOOP)
    @i
    D=M
    @n
    D=D-M
    @END
    D;JGT // if i > n, jump to END

    @R2 
    D=M
    @k
    D=D+M
    @R2
    M=D
    @i 
    M=M+1
    @LOOP
    0;JMP

(END)
    @END
    0;JMP