`timescale 1ns / 1ns
`include "comparator4bit.v"

//comparator4bit(w0, w1, less, equal, greater);
module comparator4bit_tb;
    reg[3:0] w0, w1;
    wire less, equal, greater;

    comparator4bit comparator(w0, w1, less, equal, greater);

    initial begin
        $dumpfile("comparator4bit_tb.vcd");
        $dumpvars(0, comparator4bit_tb);

        w0 = 4'b0001; w1 = 4'b0001;
        #20
        w0 = 4'b0011; w1 = 4'b0001;
        #20
        w0 = 4'b0101; w1 = 4'b0101;
        #20
        w0 = 4'b1000; w1 = 4'b1000;
        #20
        w0 = 4'b0110; w1 = 4'b1011;
        #20
        w0 = 4'b1010; w1 = 4'b1010;
        #20
        $finish;
    end
endmodule