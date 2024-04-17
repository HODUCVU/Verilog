`timescale 1 ns/10 ps
`include "fsm_eg_mult_seg.v"
module fsm_eg_mult_seg_tb ();
	// declaration
	localparam T=20; //clock period
	reg clk, reset;
	reg a, b;
	wire y0, y1;
	// design under test
	fsm_eg_mult_seg dut (.clk(clk), 
	.reset(reset), .a(a), .b(b), 
	.y0(y0), .y1(y1));
	// clock
	always
	begin
		clk = 1'b1;
		#(T/2);
		clk = 1'b0;
		#(T/2);
	end
	//reset 
	initial 
	begin
		reset = 1'b1;
		#(T); #(T/2);
		reset = 1'b0;
	end

  initial begin 
    $dumpfile("fsm_eg_mult_seg_tb.vcd");
    $dumpvars(0, fsm_eg_mult_seg_tb);
  end
	// stimulus
	initial
	begin
		// wait for half cycle
		#(T/2);
		a = 1'b0;
		b = 1'b1;
		
		#(4*T);
		a = 1'b1;
		
		#(2*T);
		a = 1'b1;
		b = 1'b0;
		
		#(1*T);
		a = 1'b0;

		#(3*T);
		a = 1'b1;
		
		#(2*T);
    $finish;
	end

endmodule
