`include "dff_en_2seg.v"

module dff_en_2seg_tb;
  reg clk, reset, en, d;
  wire q;

  dff_en_2seg dff (.clk(clk), .reset(reset), .en(en), .d(d), .q(q));

  initial  begin
   $dumpfile("dff_en_2seg_tb");
   $dumpvars(0, dff_en_2seg_tb);
  end

  always #2 clk = ~clk;

  initial begin
    en = 0; reset = 0; d = 0; clk = 0;
    #3; 
    repeat (6) begin
      d = $urandom_range(0, 1);
      #3;
    end
    reset = 1; #3;
    reset = 0; #3;
    en = 1; #3;
    repeat (6) begin
      d = $urandom_range(0, 1);
      #3;
    end
    en = 0; #3;
    repeat (6) begin
      d = $urandom_range(0, 1);
      #3;
    end
    $display("Complete testbench");
    $finish;
  end
endmodule
