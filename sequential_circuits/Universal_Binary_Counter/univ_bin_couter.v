module univ_vin_counter #(parameter N=8) (clk, reset, 
			syn_clr, load, en , up, d, max_tick, min_tick, q);
// init port
input wire clk, reset, syn_clr, load, en, up;
input wire[N-1:0] d;
output wire max_tick, min_tick;
output wire [N-1:0] q;

// Signal declaration
reg [N-1:0] r_reg, r_next;

always @(posedge clk, posedge reset)
	if (reset)
		r_reg <= 0;
	else
		r_reg <= r_next;
// next state logic
always @*
	if(syn_clr)
		r_next = 0;
	else if (load)
		r_next = d;
	else if (en & up)
		r_next = r_reg + 1;
	else if (en & ~up)
		r_next = r_reg - 1;
	else
		r_next = r_reg;
//output
assign q = r_reg;
assign max_tick = (r_reg == 2**N-1) ? 1'b1: 1'b0;
assign min_tick = (r_reg == 0) ? 1'b1: 1'b0;
endmodule

