`timescale 1ns / 1ns
`include "units.v"

module units_tb;
    reg[3:0] itb;
    wire ytb;

    units u(.i(itb), .y(ytb));

    initial begin
        $dumpfile("units_tb.vcd");
        $dumpvars(0, units_tb);

        itb = 4'b0000; #20
        itb = 4'b0001; #20
        itb = 4'b0010; #20
        itb = 4'b0011; #20
        itb = 4'b0100; #20
        itb = 4'b0101; #20
        itb = 4'b0110; #20
        itb = 4'b0111; #20

        itb = 4'b1000; #20
        itb = 4'b1001; #20
        itb = 4'b1010; #20
        itb = 4'b1011; #20
        itb = 4'b1100; #20
        itb = 4'b1101; #20
        itb = 4'b1110; #20
        itb = 4'b1111; #20
        
        $finish;
    end
endmodule