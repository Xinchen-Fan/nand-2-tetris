# modified from "https://github.com/PKUFlyingPig/NandToTetris/blob/master/projects/06/Assembler.py"

import sys

new_var_addr = 16
symbol_table = { # pre-defined label
    "SP":0,"LCL":1,"ARG":2,"THIS":3,"THAT":4,
	"R0":0,"R1":1,"R2":2,"R3":3,"R4":4,"R5":5,
	"R6":6,"R7":7,"R8":8,"R9":9,"R10":10,"R11":11,
	"R12":12,"R13":13,"R14":14,"R15":15,
	"SCREEN":16384,"KBD":24576 
} 
comp_table = { 
    "0":"0101010","1":"0111111","-1":"0111010",
	"D":"0001100","A":"0110000","!D":"0001101", 
	"!A":"0110001","-D":"0001111","-A":"0110011",
	"D+1":"0011111","A+1":"0110111","D-1":"0001110",
	"A-1":"0110010","D+A":"0000010","D-A":"0010011",
	"A-D":"0000111","D&A":"0000000","D|A":"0010101",
	"M":"1110000","!M":"1110001","-M":"1110011",
	"M+1":"1110111","M-1":"1110010","D+M":"1000010",
	"D-M":"1010011","M-D":"1000111","D&M":"1000000",
	"D|M":"1010101" 
}
dest_table = { 
    "null":"000","M":"001","D":"010","MD":"011",
	"A":"100","AM":"101","AD":"110","AMD":"111" 
}
jmp_table = {   
    "null":"000","JGT":"001","JEQ":"010","JGE":"011",
	"JLT":"100","JNE":"101","JLE":"110","JMP":"111" 
}


def dec2bin(decimal):
	binary = bin(int(decimal))[2:] # bin(x) is like "0b010110"
	binary="0" * (16-len(binary)) + binary 
	return binary

def load_asm_file(file_path, asm_codes): # load contents in .asm file and preprocess
    with open(file_path,'r') as file:
        for line in file:
            # drop comments 
            comm = line.find("//")
            if (comm != -1):
                line = line[:comm]
            # drop '\n' and space
            content = line.strip('\n').strip()  
            # drop blank line & save codes        
            if (len(content) != 0): 
                asm_codes.append(content)

def parse_a(command):
    global new_var_addr
    if (command.isdecimal()):
        return dec2bin(command)
    elif (symbol_table.get(command)) == None: # new variable
        binary_code = dec2bin(new_var_addr)
        symbol_table[command] = new_var_addr
        new_var_addr += 1
        return binary_code
    else:
        addr = symbol_table.get(command)
        return dec2bin(addr)


def parse_c(command):
        equal_loc = command.find("=")
        semicolon_loc = command.find(";")
        dest=""
        comp=""
        jmp=""
        if (equal_loc == -1):
            dest = "null"
        if (semicolon_loc == -1):
            jmp="null"
            semicolon_loc=len(command)
        if (len(dest) == 0):
            dest = command[:equal_loc]
        if (len(jmp) == 0):
            jmp = command[semicolon_loc+1:]
        comp = command[equal_loc+1:semicolon_loc]
        binary_code = "111" + comp_table[comp] + dest_table[dest] + jmp_table[jmp]
        return binary_code

def parser(asm_codes, binary_codes):
    # deal with label
    asm_pure_codes = []
    curr_item=-1
    for item in asm_codes:
        if (item[0] == '('):
            symbol_table[item[1:-1]] = curr_item + 1
        else:
            asm_pure_codes.append(item)
            curr_item += 1
    # print_codes(asm_pure_codes) # for debug
    # deal with A/C command seperately
    for item in asm_pure_codes:
        if (item[0] == '@'):    # A-command
            binary_codes.append(parse_a(item[1:]))
        else:                   # C-command
            binary_codes.append(parse_c(item))


def save_bin_file(binary_codes):
    binary_file = sys.argv[1][:-4] + ".hack"
    with open(binary_file,'w') as file:
        for item in binary_codes:
            file.write(item + '\n')

def print_codes(codes): # print the codes
    i = -1
    for item in codes:
        i = i + 1
        print('{:5d}:  \''.format(i) + item + '\'')
    print('\n')

def main():
    asm_file = sys.argv[1]                                # get .asm file name
    asm = []                                              # assembly language
    binary = []                                           # machine language 
    load_asm_file(file_path=asm_file, asm_codes=asm)      # load .asm file and preprocess
    print_codes(codes=asm)                                # for debug
    parser(asm_codes=asm, binary_codes=binary)            # translate assembly language to machine language
    print_codes(binary)                                   # for debug
    save_bin_file(binary_codes=binary)                    # save machine language to .hack file

if __name__ == '__main__':
    main()

