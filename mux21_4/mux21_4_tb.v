`timescale 1ns / 1ns
`include "mux21_4.v"

module mux21_4_tb;
    wire[3:0] Y;
    reg S;
    reg[3:0] wa, wb;

    //mux21_4(w0, w1, s,y);
    mux21_4 mux(.w0(wa), .w1(wb), .s(S), .y(Y));

    initial begin
        $dumpfile("mux21_4_tb.vcd");
        $dumpvars(0, mux21_4_tb);

        wa = 4'b0001;
        wb = 4'b0111;
        S = 1'b0;
        #20
        wa = 4'b0010;
        wb = 4'b0111;
        S = 1'b0;
        #20
        wa = 4'b0011;
        wb = 4'b0111;
        S = 1'b0;
        #20
        wa = 4'b0100;
        wb = 4'b0111;
        S = 1'b0;
        #20
        wa = 4'b0101;
        wb = 4'b0111;
        S = 1'b0;
        #20
        wa = 4'b0110;
        wb = 4'b0111;
        S = 1'b0;
        #20
        wa = 4'b0111;
        wb = 4'b0111;
        S = 1'b0;
        #20
        wa = 4'b1000;
        wb = 4'b0111;
        S = 1'b0;
        #20
        wa = 4'b1001;
        wb = 4'b0111;
        S = 1'b0;
        #20
        
        // ---
        wb = 4'b0001;
        wa = 4'b0111;
        S = 1'b1;
        #20
        wb = 4'b0010;
        wa = 4'b0111;
        S = 1'b1;
        #20
        wb = 4'b0011;
        wa = 4'b0111;
        S = 1'b1;
        #20
        wb = 4'b0100;
        wa = 4'b0111;
        S = 1'b1;
        #20
        wb = 4'b0101;
        wa = 4'b0111;
        S = 1'b1;
        #20
        wb = 4'b0110;
        wa = 4'b0111;
        S = 1'b1;
        #20
        wb = 4'b0111;
        wa = 4'b0111;
        S = 1'b1;
        #20
        wb = 4'b1000;
        wa = 4'b0111;
        S = 1'b1;
        #20
        wb = 4'b1001;
        wa = 4'b0111;
        S = 1'b1;
        #20
        
        $display("Finish Test");
        $finish;
    end

endmodule