module logicUnits(x, y, s, f);
    input x, y;
    input wire[3:0] s;
    output reg f;

    reg f1, f2, f3, f4;

    always @* begin
        f1 = x*y*s[3];
        f2 = x*(~y)*s[2];
        f3 = (~x)*y*s[1];
        f4 = (~x)*(~y)*s[0];

        f = f1 + f2 + f3 + f4;
    end
endmodule