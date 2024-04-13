module regFile( Ip1,

  sel_i1, 

  Op1,

  sel_o1, 

  Op2,

  sel_o2, 

  RD,

  WR, 

  rst,

  EN, 

  clk

);      

input  [31:0]  Ip1; 

input  [3:0]  sel_i1,

  sel_o1,

  sel_o2; 

input  RD,

  WR; 

input  EN,

  clk,

  rst; 

output [31:0]  Op1,

  Op2; 

reg  [31:0]  Op1,

  Op2;       

reg [31:0]  regFile [0:15]; 

integer i; 

wire  sen; 

assign sen = clk || rst; 

always @ (posedge sen) 

begin 

if (EN == 1) 

begin 

if (rst == 1) //If at reset 

begin 

for (i = 0; i < 16; i = i + 1) begin
  regFile [i] = 32'h0; 

end 

Op1 = 32'hx; 

end 

else if (rst == 0) //If not at reset 

begin 

case ({RD,WR}) 

  2'b00:  begin 

end 

2'b01:  begin //If Write only 

regFile [sel_i1] = Ip1; 

end 

2'b10:  begin //If Read only 

Op1 = regFile [sel_o1]; 

Op2 = regFile [sel_o2]; 

end 

2'b11:  begin //If both active 

Op1 = regFile [sel_o1]; 

Op2 = regFile [sel_o2]; 

regFile [sel_i1] = Ip1; 

end 

default: begin //If undefined 

end 

endcase 

end 

else; 

end 

else; 

end 

endmodule


