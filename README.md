# I use Icarus for this series code

## Start: 
	```
	iverilog.exe
	```

## Complite: 
	```
	iverilog -o <MUX2_1_testbend.vvp> <MUX2_1_testbend.v>
	```
	> with <name run program> <name testbend coded>\
## run:
	```
	vvp <MUX2_1_testbend.vvp>
	```
	> get file vcd to check wave signal

## Run vcd file:
	* ** Step 1 **: gtkwave => use to check wave signal
	* ** Step 2 **: Add vcd file.
	* ** STep 3 **: Select signal and "Append" to see wave signal