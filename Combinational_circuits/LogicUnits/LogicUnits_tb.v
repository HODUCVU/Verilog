`timescale 1ns / 1ns
`include "LogicUnits.v"

module logicUnits_tb;
    reg x, y;
    reg [3:0] s;

    wire f;

    logicUnits unitA(x,y,s,f);

    initial begin
        $dumpfile("logicUnits_tb.vcd");
        $dumpvars(0, logicUnits_tb);
        x =0; y = 1; s = 4'b0001;
        #20;
        x =1; y = 0; s = 4'b0001;
        #20;
        x =1; y = 1; s = 4'b0001;
        #20;

        x =0; y = 1; s = 4'b0010;
        #20;
        x =1; y = 0; s = 4'b0010;
        #20;
        x =1; y = 1; s = 4'b0010;
        #20;

        x =0; y = 1; s = 4'b0011;
        #20;
        x =1; y = 0; s = 4'b0011;
        #20;
        x =1; y = 1; s = 4'b0011;
        #20;
        
        x =0; y = 1; s = 4'b0100;
        #20;
        x =1; y = 0; s = 4'b0100;
        #20;
        x =1; y = 1; s = 4'b0100;
        #20;

        x =0; y = 1; s = 4'b0101;
        #20;
        x =1; y = 0; s = 4'b0101;
        #20;
        x =1; y = 1; s = 4'b0101;
        #20;

        x =0; y = 1; s = 4'b0111;
        #20;
        x =1; y = 0; s = 4'b0111;
        #20;
        x =1; y = 1; s = 4'b0111;
        #20;

        $finish;
    end
endmodule