# nand-2-tetris
## My project for Nand2Tetris
### File directory
- `tools`: software tools
- `projects`: files modified and completed for nand2tetris

### Notes
- [Nand2Tetris Part I: Hardware](./notes/hardware.md)

### Resources
- official website - [Nand2Tetris](https://www.nand2tetris.org/)
- Coursera - [Nand2Tetris Part I](https://www.coursera.org/learn/build-a-computer) and [Nand2Tetris Part II](https://www.coursera.org/learn/nand2tetris2)


## Implement Hack CPU in Verilog (with unit test)
### File directory
- `vrtl/`: RTL code for Hack CPU (Verilog)
- `vtest/`: testbench, test script and test results

### Notes
- [Specification](./notes/verilog-spec.md)

### Test
run unit test(in the root directory):

```sh
python ./vtest/tester.py <module name>
```

### Usage
compile the software into machine code and save it to `/vtest/inst.data`, write the corresponding testbench in `/vtest/tb/top_tb.v` and run(in the root directory):

```sh
python ./vtest/tester.py top
```



