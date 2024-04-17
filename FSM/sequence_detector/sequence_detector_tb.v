`timescale 1 ns/10 ps
`include "sequence_detector.v"

module sequence_detector_tb;
  
  localparam T=20;
  reg clk, reset;
  reg w;
  wire z;
  sequence_detector sq(.clk(clk), .reset(reset), 
                  .w(w), .z(z));

  always 
  begin 
    clk = 1'b1;
    #(T/2);
    clk = 1'b0;
    #(T/2);
  end

  initial
  begin 
    $dumpfile("sequence_detector_tb.vcd");
    $dumpvars(0, sequence_detector_tb);
  end
  initial
  begin 
    reset = 1'b1;
    #(T); #(T/2);
    reset = 1'b0;
  end 

  initial
  begin 
    #(T/2);
    w = 0;
    #(T/2);
    w = 1;
    #(T/2);
    w = 0;
    #(T/2);
    w = 1;
    #(T/2);
    w = 1;
    #(T/2);
    w = 0;
    #(T/2);
    w = 1;
    #(T/2);
    w = 1;
    #(T/2);
    w = 1;
    #(T/2);
    w = 0;
    #(T/2);
    w = 1;
    $finish;
  end 
endmodule
