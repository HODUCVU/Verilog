module hex2seg( w0, segs);
    input  wire[3:0]  w0;
    output reg [6:0] segs;
    
    //Define seven-segment display constants
    parameter zero = 7'b0000001;
    parameter one = 7'b1001111;
    parameter two = 7'b0010010;
    parameter three = 7'b0000110;
    parameter four = 7'b1001100;
    parameter five = 7'b0100100;
    parameter six = 7'b0100000;
    parameter seven = 7'b0001111;
    parameter eight = 7'b0000000;
    parameter nine = 7'b0000100;
    parameter ten = 7'b0001000;
    parameter eleven = 7'b1100000;  
    parameter twelve = 7'b0110001;
    parameter thirteen = 7'b1000010;
    parameter fourteen = 7'b0110000;
    parameter fifteen = 7'b0111000;
    
    //Switch case to assign seven segment display
    always @(w0)
        begin
            case(w0)
                4'b0000: segs <= zero;
                4'b0001: segs <= one;
                4'b0010: segs <= two;
                4'b0011: segs <= three;
                4'b0100: segs <= four;
                4'b0101: segs <= five;
                4'b0110: segs <= six;
                4'b0111: segs <= seven;
                4'b1000: segs <= eight;
                4'b1001: segs <= nine;
                4'b1010: segs <= ten; // A
                4'b1011: segs <= eleven; //B
                4'b1100: segs <= twelve;  //C
                4'b1101: segs <= thirteen; //D
                4'b1110: segs <= fourteen; //E
                4'b1111: segs <= fifteen; //F
            endcase
        end
endmodule