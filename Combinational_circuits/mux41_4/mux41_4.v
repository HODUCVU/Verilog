`include "../mux21_4/mux21_4.v"

module mux41_4(w0,w1,w2,w3,s,y);
    input wire[3:0] w0, w1, w2, w3;
    input wire[1:0] s;
    output wire[3:0] y;
    
    wire[3:0] wx, wy;

    mux21_4 muxA(w0, w1, s[0], wx);
    mux21_4 muxB(w2, w3, s[0], wy);
    mux21_4 muxC(wx, wy, s[1], y);
    
endmodule