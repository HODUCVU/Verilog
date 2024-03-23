`timescale 1ns / 1ns
`include "MUX2_1.v"

module MUX2_1_testbend;
    wire Y;
    reg a,b,s;

MUX2_1 mux(.w0(a),.w1(b), .s(s), .y(Y));

initial begin
    $dumpfile("MUX2_1_testbend.vcd");
    $dumpvars(0, MUX2_1_testbend);

    a = 0;
    b = 0;
    s = 0;
    #20;
    a = 0;
    b = 1;
    s = 0;
    #20;
    a = 1;
    b = 0;
    s = 0;
    #20;
    a = 1;
    b = 1;
    s = 0;
    #20;

    a = 0;
    b = 0;
    s = 1;
    #20;
    a = 0;
    b = 1;
    s = 1;
    #20;
    a = 1;
    b = 0;
    s = 1;
    #20;
    a = 1;
    b = 1;
    s = 1;
    #20;

    $display("Test Completed");
    $finish;
end
endmodule