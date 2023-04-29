import sys

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

def translate(asm_codes, binary_codes):
    pass

def save_binary_codes(binary_codes):
    binary_file = sys.argv[1][:-4] + ".hack"
    with open(binary_file,'w') as file:
        for item in binary_codes:
            file.write(item + '\n')

def print_codes(codes): # print the codes
    i = 0
    for item in codes:
        i = i + 1
        print('{:5d}:  \''.format(i) + item + '\'')

def main():
    asm_file = sys.argv[1]                              # get .asm file name
    asm = []                                            # assembly language
    binary = []                                         # machine language 
    load_asm_file(file_path=asm_file, asm_codes=asm)    # load .asm file and preprocess
    print_codes(codes=asm)                              # for debug
    translate(asm_codes=asm, binary_codes=binary)       # translate assembly language to machine language
    print_codes(binary)                                 # for debug
    save_binary_codes(binary_codes=binary)              # save machine language to .hack file

if __name__ == '__main__':
    main()

