module units(i, y);
    input wire[3:0] i;
    output reg y;

    reg w1, w2;

    always @* begin
        w1 = ~(i[0] & i[1]);
        w2 = i[2] | w1;
        y = (~i[3]) & w2;
    end
endmodule