module counter_to_100(clk, reset, up_down, count10, count100, carry10, carry100);

  input wire clk, reset, up_down;
  output reg carry10, carry100;
  output reg[3:0] count10, count100;

  always @(posedge clk or posedge reset)
  begin 
    if(reset) begin 
      count10 = 4'b0; count100 = 4'b0;
      carry10 = 1'b0; carry100 = 1'b0;
    end 
    if(up_down) begin 
      if(count10 == 4'b1001) begin 
        carry10 = 1'b1;
        count10 <= 4'b0;
      end 
      else begin 
        carry10 = 1'b0;
        count10 <= count10 + 4'b1;
      end 
      if(carry10 == 1'b1) begin
        if (count100 == 4'b1001) begin 
        count100 <= 4'b0;
        carry100 = 1'b1;
        end
        else begin 
          count100 <= count100 + 4'b1;
          carry100 = 1'b0;
        end
      end 
    end 
    else begin 
      if(count10 == 4'b0) begin 
        carry10 = 1'b1;
        count10 <= 4'b1001;
      end 
      else begin 
        count10 <= count10 - 4'b1;
        carry10 = 0;
      end 
      if(carry10 == 1) begin 
        if (count100 == 4'b0) begin
          count100 <= 4'b1001;
          carry100 = 1;
        end
        else begin 
          count100 <= count100 - 4'b1;
          carry100 = 0;
        end
      end 
    end 
  end 
endmodule
