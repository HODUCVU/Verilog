module dff_reset(clk, reset, d, q);

	input wire clk, reset, d;
	output reg q;

	always @(posedge clk, posedge reset)
		if (reset)
			q <= 1'b0;
		else
			q <= d;
endmodule
