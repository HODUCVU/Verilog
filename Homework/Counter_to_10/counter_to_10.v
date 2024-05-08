module counter_to_10(clk, reset, d, q, c);

  input wire clk, reset, d;
  output reg c;
  output reg[3:0] q; // from 0 to 9 

  reg [1:0] state_reg, state_next;

  localparam [1:0] UP = 2'b10, DOWN = 2'b01, Start = 2'b00;

  always @(posedge clk)
    if (reset) begin
      state_reg <= Start;
      q <= 4'b0;
    end
    else
      state_reg <= state_next;

  always @*
  begin 
    if(state_reg == Start) begin 
      q = 4'b0;
    end 
    else if(state_reg == UP) begin 
      if(q == 4'b1001) begin 
        q = 4'b0;
        c = 1;
      end 
      else begin 
        q = q + 4'b1;
        c = 0;
      end
    end 
    else if(state_reg == DOWN) begin 
      if(q == 4'b0) begin 
        q = 4'b1001;
        c = 1;
      end 
      else begin 
        q = q - 4'b1;
        c = 0;
      end
    end 
  end

  always @(state_reg or d)
    case(state_reg) 
      Start: begin 
        //q = 4'b0000; 
        if(!d) begin
          state_next = UP;
        //  c = 0;
        end
        else begin 
          state_next = DOWN;
        //  c = 1;
        end
      end
      UP: begin 
        //q++;
        //if(q == 4'b1001) begin 
        //  c = 1;
         // q = 0;
        //end
        //else begin 
         // q = q + 4'b0001;
          //c = 0;
        //end
        if(d)
          state_next = DOWN;
      end
      DOWN: begin 
        //if (q == 0) begin 
        //  c = 1;
        //  q = 4'b1001;
        //end 
        //else begin 
        //  q = q - 4'b0001;
        //  c = 0;
        //end 
        if(!d)
          state_next = UP;
      end
    endcase
endmodule
