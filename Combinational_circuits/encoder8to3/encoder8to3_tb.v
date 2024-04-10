`timescale 1ns / 1ns
`include "encoder8to3.v"

module encoder8to3_tb;
    wire [3:0] tb_Y;
    reg [7:0] tb_r;
    
    encoder8to3 encoder(.r(tb_r), .Y(tb_Y));

    initial begin
        $dumpfile("encoder8to3_tb.vcd");
        $dumpvars(0, encoder8to3_tb);

        tb_r= 8'b01010110;
        #20
        tb_r= 8'b10010110;
        #20
        tb_r= 8'b11010110;
        #20
        tb_r= 8'b11100110;
        #20
        tb_r= 8'b11110110;
        #20
        tb_r= 8'b11111010;
        #20
        tb_r= 8'b11111100;
        #20
        tb_r= 8'b11111110;
        #20
        tb_r= 8'b11111111;
        #20
        $display("Test completed");  // Display a message indicating test completion
        $finish;  // End simulation
    end
endmodule
