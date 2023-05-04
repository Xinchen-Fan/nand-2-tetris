import sys
import subprocess
import os

def main():
    # dirs and files
    test_dir = r'vtest/'
    rtl_dir = r'vrtl/'
    tb_file = test_dir + r'tb/' + sys.argv[1] + r'_tb.v'

    # compile rtl by iverilog
    iverilog_cmd = ['iverilog'] # iverilog
    iverilog_cmd += ['-o', test_dir + r'dumpfile/out.vvp'] # compile result
    iverilog_cmd += ['-I', rtl_dir] # path for verilog head(defs.v)
    iverilog_cmd += ['-D', r'OUTPUT="signature.output"'] # simulation output file
    iverilog_cmd.append(tb_file) # testbench
    file = os.listdir(rtl_dir)
    for f in file:
        iverilog_cmd.append(rtl_dir + f) # rtl file
    process = subprocess.Popen(iverilog_cmd)
    process.wait(timeout=10)

    # executes the default compiled form generated by Icarus Verilog
    vvp_cmd = [r'vvp']
    vvp_cmd.append(test_dir + r'dumpfile/out.vvp')
    process = subprocess.Popen(vvp_cmd)
    try:
        process.wait(timeout=20)
    except subprocess.TimeoutExpired:
        print('!!!Fail, vvp exec timeout!!!')

    # open "wave.vcd" to inspect waves 
    cmd = r'gtkwave ' + test_dir + r'dumpfile/' + sys.argv[1] + r'.vcd '
    f = os.popen(cmd)
    f.close()

if __name__ == '__main__':
    sys.exit(main())