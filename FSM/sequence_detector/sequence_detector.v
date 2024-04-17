module sequence_detector(clk, reset, w, z);

  input wire clk, reset;
  input wire w;
  output reg z;

  localparam [1:0] A = 2'b00,
                   B = 2'b01,
                   C = 2'b10;
  
  reg [1:0] state_reg, state_next;
  always @(posedge clk, posedge reset)
    if (reset)
      state_reg <= A;
    else
      state_reg <= state_next;

  always @*
    case (state_reg)
      A:
      begin
        z = 0;
        if(w)
          state_next = B;
      end
      B:
      begin 
        z = 0;
        if(w)
          state_next = C;
        else
          state_next = A;
      end 
      C: 
      begin 
        z = 1;
        if(!w)
          state_next = A;
      end
      default: state_next = A;
    endcase
endmodule
