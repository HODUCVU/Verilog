module counter_to_10(clk, reset, d, q, c);

  input wire clk, reset, d;
  output reg c;
  output reg[3:0] q; // from 0 to 9 

  reg [1:0] state_reg, state_next;

  localparam [1:0] UP = 2'b10, DOWN = 2'b01, Start = 2'b00;
  always @(posedge clk)
    if (reset)
      state_reg <= Start;
    else
      state_reg <= state_next;

  always @(state_reg or d)
    case(state_reg) 
      Start: begin 
        q = 0;
        if(!d) begin
          state_next = UP;
          c <= 0;
        end
        else begin 
          state_next = DOWN;
          c <= 1;
        end
      end
      UP: begin 
        if(q == 9) begin 
          c <= 1;
          q = 0;
        end
        else begin 
          q = q + 1;
          c <= 0;
        end
        if (d)
          state_next = DOWN;
      end
      DOWN: begin 
        if (q == 0) begin 
          c <= 1;
          q = 9;
        end 
        else begin 
          q = q - 1;
          c <= 0;
        end 
        if(!d)
          state_next = UP;
      end
    endcase
endmodule
