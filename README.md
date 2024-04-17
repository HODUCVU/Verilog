# I use Icarus for this series code
# Struct Repository
```
├── Combinational_circuits
│   ├── FMUX2_1
│   │   ├── MUX2_1.v
│   │   ├── MUX2_1_testbend.v
│   │   └── MUX2_1_testbend.vvp
│   ├── FullAdder1bit
│   │   ├── FullAdder1bit.v
│   │   ├── FullAdder1bit_tb.v
│   │   ├── schematic-fulladder.png
│   │   └── truth-table-fulladder.png
│   ├── LogicUnits
│   │   ├── LogicUnits.v
│   │   ├── LogicUnits_tb.v
│   │   ├── units.v
│   │   ├── units_tb.v
│   ├── comparator4bit
│   │   ├── comparator4bit.v
│   │   ├── comparator4bit_tb.v
│   ├── decoder2to4
│   │   ├── decoder2to4.v
│   │   ├── decoder2to4_tb.v
│   ├── encoder4to2
│   │   ├── encoder4to2.v
│   │   ├── encoder4to2_tb.v
│   ├── encoder8to3
│   │   ├── encoder8to3.v
│   │   ├── encoder8to3_tb.v
│   ├── hex2seg
│   │   ├── hex2seg.v
│   │   ├── hex2seg_tb.v
│   │   └── truth-table-hex2segs.png
│   ├── mux21_4
│   │   ├── mux21_4.v
│   │   ├── mux21_4_tb.v
│   │   └── simulation.gtkw
│   └── mux41_4
│       ├── mux41_4.v
│       ├── mux41_4_tb.v
└── sequential_circuits
    ├── DFF_with_Asynchronous_Reset
    │   ├── dff_reset.v
    │   ├── dff_reset_tb.v
    ├── DFF_with_Synchronous_enable
    │   ├── dff_en_2seg.v
    │   ├── dff_en_2seg_tb.v
    ├── Register_file
    │   ├── reg_file.v
    │   ├── reg_file_tb.v
    ├── Register_file_Advance
    │   ├── register_file.v
    │   ├── register_file_tb.v
    ├── Universal_Binary_Counter
    │   ├── univ_bin_couter.v
    │   └── univ_bin_couter_tb.v
    └── Universal_Shift_Register
        ├── shift_register.v
        └── shift_register_tb.v
```
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
* **Step 1**: *gtkwave* => use to check wave signal
* **Step 2**: Add vcd file.
* **Step 3**: Select signal and "*Append*" to see wave signal
