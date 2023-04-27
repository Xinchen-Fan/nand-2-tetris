# Nand2Tetris Part I: Hardware

## Overview
Target: build a complete general purpose working computer from the ground up, hardware and software(in Part II)


## Project 00

Download the `Nand2Tetris Software Suite` to computer. The software suite includes all the software tools and project files that will be used throughout the course. After downloading, locate `file.txt` in the `nand2tetris/projects/00` folder on your computer. There is no need to understand or modify the contents of this file. Compress the file into a zip file named `project0.zip`.

Use the following bash command to compress `file.txt` to `project0.zip`

```sh
zip -r project0.zip file.txt
```


## Project 01 Boolean Logic
Building elementary logic gates like And, Or, Not, Multiplexor, and more

- primitive elements: Nand
- Not: out = Nand(in, in)
- And: out = Not(Nand(a,b))
- Or: out = Nand(Not(a), Not(b))
- Xor: out = Or(And(a,Not(b)),And(Not(a),b))
- Mux: out = Or(And(sel,b),And(Not(sel),a))
- Muiti-bit Not,And,Or,Mux is similar
- Or8Way: tree like structure
- Demultiplexor(DMux, DMux4Way, DMux8Way, Mux4Way16, Mux8Way16): process channels independently

## Project 02 Boolean Arithmetic
Building a family of adder chips, culminating in the construction of an Arithmetic Logic Unit (ALU)

- HalfAdder: sum = Xor(a,b), carry = And(a,b) 
- FullAdder: sum = Xor(c,Xor(a,b)), carry = Or(And(a,b), And(c,Xor(a,b)))

## Project 03 Sequential Logic
Building registers and memory units, culminating in the construction of a Random Access Memory (RAM)

## Project 04 Machine Language
Learning a machine language and using it to write some illustrative low-level programs

## Project 05 Computer Architecture
Using the chipset built in projects 1-3 to build a Central Processing Unit (CPU) and a hardware platform capable of executing programs written in the machine language introduced in project 4


## Project 06 Assembler
Developing an assembler, i.e. a capability to translate programs written in symbolic machine language into binary, executable code.

