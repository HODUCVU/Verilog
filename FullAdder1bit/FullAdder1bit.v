module FullAdder1bit( w0, w1, cin, y, cout);
    // w0, w1, cin, y, cout
    input wire w0, w1, cin;
    output reg y, cout;

    reg line1, line2, line3;

    always @(w0 or w1 or cin) begin
        line1 = w0^w1;
        y = cin^line1;

        line2 = w0&w1;
        line3 = line1&cin;
        cout = line2|line3;
    end
endmodule