module dff_en_2seg(clk, reset, en, d, q);
	input wire clk, reset, en, d;
	output reg q;

	// signal
	reg r_reg, r_next;
	
	// DFF
	always @(posedge clk, posedge reset)
		if (reset)
			r_reg <= 1'b0;
		else
			r_reg <= r_next;
	always @*
		if (en)
			r_next = d;
		else 
			r_next = r_reg;

	// output
	always @*
		q = r_reg;

endmodule





