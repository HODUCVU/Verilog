`timescale 1ns/ 10ps
`include "sequence_detector_2.v"

module sequence_detector_2_tb;

  reg w, clk, reset;
  wire z;
  localparam T = 20;
  sequence_detector_2 detector(.w(w), .z(z), .clk(clk),.reset(reset));

  always
  begin 
  clk = 1'b1;
  #(T/4);
  clk = 1'b0;
  #(T/4);
  end

  initial
  begin 
    $dumpfile("sequence_detector_2_tb.vcd");
    $dumpvars(0, sequence_detector_2_tb);
  end 

  initial
  begin 
    reset <= 1; w <= 0;

    #(T/2); reset <= 0; w <= 0; 
    #(T/2); w <= 1;
    #(T/2); w <= 0;
    #(T/2); w <= 0;
    #(T/2); w <= 1;

    #(T/2); w <= 1;
    #(T/2); w <= 0;
    #(T/2); w <= 1;

    #(T/2); reset <= 1; 
    #(T/2); reset <= 0; 
    #(T/2); w <= 0;
    #(T/2); w <= 0;
    #(T/2); w <= 1;

    #(T/2); reset <= 1; 
    #(T/2); reset <= 0; 
    #(T/2); w <= 0;
    #(T/2); w <= 1;
    #(T/2); w <= 1;
    #(T*4); $finish;
  end 
endmodule

