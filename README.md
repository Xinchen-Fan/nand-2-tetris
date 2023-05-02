# nand-2-tetris
- my project for Nand2Tetris
- implement Hack CPU in Verilog (with unit test)

## Project notes
- [Nand2Tetris Part I: Hardware](./notes/hardware.md)
- [ALU Specification](./notes/alu-spec.md)

## Verilog implementation 
### Chip set

| count | name | file | spec |
| :--------: | :--------: | :--------: | :--------: |
| 01 | `Nand` | Nand.v | 1-bit nand gate |
| 02 | `Not` | Not.v | 1-bit not gate |
| 03 | `And` | And.v | 1-bit and gate |
| 04 | `Or` | Or.v | 1-bit or gate |
| 05 | `Xor` | Xor.v | 1-bit xor gate |
| 06 | `Mux` | Mux.v | 1-bit multiplexor |
| 07 | `DMux` | DMux.v | 1-bit demultiplexor |
| 08 | `Not16` | Not16.v | 16-bit not gate |
| 09 | `And16` | And16.v | 16-bit and gate |
| 10 | `Or16` | Or16.v | 16-bit or gate |
| 11 | `Mux16` | Mux16.v | 16-bit multiplexor |
| 12 | `Or8Way` | Or8Way.v | 8-way or gate |
| 13 | `Mux4Way16` | Mux4Way16.v | 4-way 16-bit multiplexor |
| 14 | `Mux8Way16` | Mux8Way16.v | 8-way 16-bit multiplexor |
| 15 | `DMux4Way` | DMux4Way.v | 4-way 1-bit demultiplexor |
| 16 | `DMux8Way` | DMux8Way.v | 8-way 1-bit demultiplexor |
| 17 | `HalfAdder` | HalfAdder.v | 1-bit half adder |
| 18 | `FullAdder` | FullAdder.v | 1-bit full adder |
| 19 | `Add16` | Add16.v | add up two 16-bit two's complement values |
| 20 | `Inc16` | Inc16.v | set out to in + 1 |
| 21 | `ALU` | ALU.v | 16-bit Arithmetic Logic Unit |
| 21 | `DFF` | DFF.v | 1-bit D Flip-Flop |


### Test
run unit test:

```sh
python ./vtest/unit_test.py <module name>
```

## Resources
- official website - [Nand2Tetris](https://www.nand2tetris.org/)
- Coursera - [Nand2Tetris Part I](https://www.coursera.org/learn/build-a-computer) and [Nand2Tetris Part II](https://www.coursera.org/learn/nand2tetris2)

