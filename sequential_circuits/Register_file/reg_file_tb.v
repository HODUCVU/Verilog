`include "reg_file.v"

module reg_file_tb;
  localparam B = 8, W = 2;
  reg clk, wr_en;
  reg [W-1:0] w_addr, r_addr;
  reg [B-1:0] w_data;
  wire [B-1:0] r_data;

  reg_file reg_unit (.clk(clk), .wr_en(wr_en), .w_addr(w_addr), 
            .r_addr(r_addr), .w_data(w_data), .r_data(r_data));
  always #2 clk = ~clk; 
  initial begin 
    $dumpfile("reg_file_tb.vcd");
    $dumpvars(0, reg_file_tb);
  end
  initial begin 
    w_addr = 0; wr_en = 0; w_data = 0; r_addr = 0;
    #3;
    w_addr = 0; r_addr = 1;
    w_data = 15;
    #3;

    wr_en = 1;
    #3;
    w_addr = 0; r_addr = 1;
    w_data = 15;
    #3;
    #3;
    w_addr = 1; r_addr = 0;
    w_data = 10;
    #3;

    #3;
    w_addr = 0; r_addr = 1;
    w_data = 5;
    #3;
    
    $display("Complete testbend");
    $finish;
  end
endmodule
