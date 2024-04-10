`timescale 1ns / 1ns
`include "hex2seg.v"

module hex2seg_tb;
    reg [3:0] w0;
    wire [6:0] segs;

    hex2seg hex(w0, segs);

    initial begin
        $dumpfile("hex2seg_tb.vcd");
        $dumpvars(0, hex2seg_tb);
        w0 = 1; #20
        w0 = 2; #20
        w0 = 3; #20
        w0 = 4; #20
        w0 = 5; #20
        w0 = 6; #20
        w0 = 7; #20
        w0 = 8; #20
        w0 = 9; #20
        w0 = 10; #20
        w0 = 11; #20
        w0 = 12; #20
        w0 = 13; #20
        w0 = 14; #20
        w0 = 15; #20
        $finish;
    end
endmodule