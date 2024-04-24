module sequence_detector_2(w, z, clk, reset);

  input wire w, clk, reset;
  output z;

  localparam [2:0] a = 0, //00
                   b = 1, // 01
                   c = 2,// 10
                   d = 3, // 11
                   e = 4;// 100
                 
  reg [2:0] state_reg, state_next;

  always @(posedge clk)
    if (reset) begin
      state_reg <= a;
    end 
    else 
      state_reg <= state_next;

  assign z = (state_reg == d) ? 1 : 0;

  always @(state_reg or w)
    case(state_reg)
      a: begin 
       if(w)
         state_next = b;
       else 
         state_next = state_reg;
      end
      b: 
      begin 
      if(w)
        state_next = a;
      else
        state_next = c;
      end
      c:
      begin 
      if (w) begin
        state_next = d;
        end
      else begin
        state_next = e;
        end
      end 
      d:
      begin
        if (w)
          state_next = b;
        else 
          state_next = c;
      end 
      e:
      begin 
        if(w) begin 
          state_next = d;
        end 
        else begin 
          state_next = a;
        end 
      end 
    endcase
endmodule
