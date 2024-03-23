`timescale 1ns / 1ns
`include "encoder4to2.v"

module encoder4to2_tb;
    wire[2:0] Y;
    reg[3:0] i;

    encoder4to2 encoder(i, Y);

    initial begin
        $dumpfile("encoder4to2_tb.vcd");
        $dumpvars(0, encoder4to2_tb);

        i = 4'b0110;
        #20
        i = 4'b1010;
        #20
        i = 4'b1101;
        #20
        i = 4'b1111;
        #20
        $finish;
    end
endmodule