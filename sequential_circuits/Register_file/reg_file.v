module reg_file #(parameter B = 8, W = 2)
				(clk, wr_en, w_addr, r_addr, w_data, r_data);
	input wire clk, wr_en;
	input wire [W-1:0] w_addr, r_addr;
	input wire [B-1:0] w_data;
	output wire [B-1:0] r_data;

	reg [B-1:0] array_reg [2**W-1:0];

	// Write operation
	always @(posedge clk)
		if(wr_en)
			array_reg[w_addr] <= w_data;
	// Read operation
	assign r_data = array_reg[r_addr];
endmodule
