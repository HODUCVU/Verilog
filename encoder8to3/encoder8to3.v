module encoder8to3(r, Y);
    input wire[7:0] r;
    output reg[3:0] Y;

    always @* begin
        casez(r)
            8'b0???????: Y = 4'b1000;
            8'b10??????: Y = 4'b0111;
            8'b110?????: Y = 4'b0110;
            8'b1110????: Y = 4'b0101;
            8'b11110???: Y = 4'b0100;
            8'b111110??: Y = 4'b0011;
            8'b1111110?: Y = 4'b0010;
            8'b11111110: Y = 4'b0001;
            8'b11111111: Y = 4'b0000;
        endcase
    end
endmodule 