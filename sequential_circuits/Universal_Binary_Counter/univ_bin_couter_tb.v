//`timescale 1ns /1ns
`include "univ_bin_couter.v"

module univ_bin_counter_tb;
	localparam T = 20;
	reg clk, reset;
	reg syn_clr, load, en, up;
	reg[2:0] d;
	wire max_tick, min_tick;
	wire [2:0] q;
	// unit
	univ_vin_counter #(.N(3)) uut (.clk(clk), .reset(reset),
		.syn_clr(syn_clr), .load(load), .en(en), .up(up), 
		.d(d), .max_tick(max_tick), .min_tick(min_tick),
		.q(q));

	// clock 20ns clock running forever
	always 
	begin
		clk = 1'b1;
		#(T/2);
		clk = 1'b0;
		#(T/2);
	end

	// reset for the first half cycle
	initial
	begin 
		reset = 1'b1;
		#(T/2);
		reset = 1'b0;
	end

	initial begin 
        $dumpfile("univ_bin_counter_tb.vcd");
        $dumpvars(0,univ_bin_counter_tb);
	end
    
	initial 
	begin
		// initial input
		syn_clr = 1'b0;
		load = 1'b0;
		en = 1'b0;
		up = 1'b1;
		d = 3'b000;
		@(negedge reset);
		@(negedge clk);
		// test load
		load = 1'b1;
		d = 3'b011;
		@(negedge clk);
		load = 1'b0;
		repeat(2); @(negedge clk);
		// test syn_clear
		syn_clr = 1'b1;
		@(negedge clk);
		syn_clr = 1'b0;
		// test up counter and pause
		en = 1'b1;
		up = 1'b1;
		repeat(10) @(negedge clk);
		en = 1'b0;
		repeat(2); @(negedge clk);
		en = 1'b1;
		repeat(2); @(negedge clk);
		// test down counter
		up = 1'b0;
		repeat(10) @(negedge clk);
		// continue until q = 2
		wait(q==2);
		@(negedge clk);
		up = 1'b1;
		// continue until min_tick becomes 1
		@(negedge clk);
		wait(min_tick);
		@(negedge clk);
		up = 1'b0;
		// absolute delay
		#(4*T);
		en = 1'b0;
		#(4*T);
        $display("Finish Test");
        $finish;
    end
endmodule
