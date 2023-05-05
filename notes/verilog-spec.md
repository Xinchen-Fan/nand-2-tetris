# Specification for Hack implemented in Verilog
## Verilog chip set
| count | name | file | spec |
| :--------: | :--------: | :--------: | :--------: |
| 00 | `defines` | [defines.v](../vrtl/defines.v) | parameters for Hack cpu |
| 01 | `alu` | [alu.v](../vrtl/alu.v) | 16-bit alu |
| 02 | `register` | [register.v](../vrtl/register.v) | general register with load and reset |
| 03 | `pc` | [pc.v](../vrtl/pc.v) | PC register |
| 04 | `hackcore` | [hackcore.v](../vrtl/hackcore.v) | Hack CPU |
| 05 | `ram` | [ram.v](../vrtl/ram.v) | data memory |
| 06 | `rom` | [rom.v](../vrtl/rom.v) | instruction memory |
| 07 | `top` | [top.v](../vrtl/top.v) | top module for computer |


## ALU truth table
| zx | nx | zy | ny | f | no | out(16-bit two's complement) |
| :--------: | :--------: | :--------: | :--------: | :--------: | :--------: | :--------: |
|if zx then x=0 | if nx then x=~x | if zy then y=0 | if ny then y=~y | if f then out=x+y else out=x&y | if no then out=~out | f(x,y)= |
| 1 | 0 | 1 | 0 | 1 | 0 | 0 |
| 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| 1 | 1 | 1 | 0 | 1 | 0 | -1 |
| 0 | 0 | 1 | 1 | 0 | 0 | x |
| 1 | 1 | 0 | 0 | 0 | 0 | y |
| 0 | 0 | 1 | 1 | 0 | 1 | ~x |
| 1 | 1 | 0 | 0 | 0 | 1 | ~y |
| 0 | 0 | 1 | 1 | 1 | 1 | -x |
| 1 | 1 | 0 | 0 | 1 | 1 | -y |
| 0 | 1 | 1 | 1 | 1 | 1 | x+1 |
| 1 | 1 | 0 | 1 | 1 | 1 | y+1 |
| 0 | 0 | 1 | 1 | 1 | 0 | x-1 |
| 1 | 1 | 0 | 0 | 1 | 0 | y-1 |
| 0 | 0 | 0 | 0 | 1 | 0 | x+y |
| 0 | 1 | 0 | 0 | 1 | 1 | x-y |
| 0 | 0 | 0 | 1 | 1 | 1 | y-x |
| 0 | 0 | 0 | 0 | 0 | 0 | x&y |
| 0 | 1 | 0 | 1 | 0 | 1 | x\|y |