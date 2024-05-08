`timescale 1ns/1ns 
//`include "counter_to_10.v"
`include "counter_to_100.v"

module counter_to_100_tb();
  reg clk, reset, up_down;
  wire carry10, carry100;
  wire[3:0] count10, count100;

  localparam T = 20;
  //module counter_to_100(clk, reset, up_down, count10, count100, carry10, carry100);
  counter_to_100 countBlock (clk, reset, up_down, count10, count100, carry10, carry100);

  always 
  begin 
    clk = 1'b1;
    #(T/4);
    clk = 1'b0;
    #(T/4);
  end

  initial
  begin 
  $dumpfile("counter_to_100_tb.vcd");
  $dumpvars(0, counter_to_100_tb);
  end

  initial 
  begin 
    #(T/2) reset <= 1; 
    #(T/2); reset <= 0; up_down <=1;
    #(T*10);
    //reset <= 1;
    #(T);up_down <=0;
    #(T*10);
    up_down <= 1;
    #(T*2) up_down <= 0;
    #(T*4);$finish;
  end
endmodule 
