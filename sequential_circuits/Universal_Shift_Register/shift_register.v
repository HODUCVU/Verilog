module univ_shift_reg #(parameter N = 8)
					(clk, reset, ctrl, d, q);

	input wire clk, reset;
	input wire [1:0] ctrl;
	input wire [N-1:0] d;
	output wire [N-1:0] q;

	reg [N-1:0] r_reg, r_next;

	//register
	always @(posedge clk, posedge reset)
		if(reset)
			r_reg <= 0;
		else
			r_reg <= r_next;

	// next-state logic
	always @*
		case(ctrl)
			2'b00: r_next = r_reg;
			2'b01: r_next = {r_reg[N-2:0], d[0]};
			2'b00: r_next = {d[N-1], r_reg[N-1:1]};
			default: r_next = d;
		endcase

	// output
	assign q = r_reg;
endmodule

