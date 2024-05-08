module counter_to_10(clk, reset, up_down, count, carry);

  input wire clk, reset, up_down;
  output reg carry;
  output reg[3:0] count;

  always @(posedge clk)
  begin 
    if(reset) begin 
      count = 4'b0;
      carry = 0;
    end
    if(up_down) begin 
      if(count == 4'b0) begin 
        count <= 4'b1001;
        carry <= 1'b1;
      end
      else begin 
        count <= count - 4'b1;
        carry <= 0;
      end
    end 
    else begin 
      if(count == 4'b1001) begin 
        count <= 4'b0;
        carry <= 1'b1;
      end 
      else begin 
        count <= count + 4'b1;
        carry <= 0;
      end 
    end
  end
endmodule
