module mux21_4(w0, w1, s,y);
    input wire[3:0] w0, w1;
    input wire s;
    output wire[3:0] y;

    assign y = s? w1:w0;
endmodule

