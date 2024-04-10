`timescale 1ns / 1ns
`include "decoder2to4.v"

module decoder2to4_tb;
    reg[1:0] itb;
    wire[3:0] ytb;

    decoder2to4 decoder(.i(itb), .y(ytb));

    initial begin
        $dumpfile("decoder2to4_tb.vcd");
        $dumpvars(0, decoder2to4_tb);

        itb = 2'b00;
        #20
        itb = 2'b01;
        #20
        itb = 2'b10;
        #20
        itb = 2'b11;
        #20
        $finish;
    end
endmodule