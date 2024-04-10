`include "dff_reset.v"
module dff_reset_tb;
	reg clk, reset, d;
	wire q;

	reg [2:0] delay;

	dff_reset dff (.clk(clk), .reset(reset), 
			.d(d), .q(q));

	// Generate clock
	always #2 clk = ~clk;

	initial 
	begin 
		$dumpfile("dff_reset_tb.vcd");
		$dumpvars(0, dff_reset_tb); 
	end

	initial begin
		clk = 0; reset = 0;
		d = 0;

		#3 reset = 1;

		repeat(6) begin
			d = $urandom_range(0, 1);
			#3;
		end
		reset = 0; #3;
		reset = 1;
		repeat(6) begin
			d = $urandom_range(0, 1);
			#3;
		end
		$display("Complete testbench");
		$finish;
	end
endmodule
		
