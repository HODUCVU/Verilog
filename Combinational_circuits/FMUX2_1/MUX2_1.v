module MUX2_1(w0, w1, s, y);

    input wire w0, w1, s;
    output wire y;

    assign y = s? w1:w0;
endmodule
