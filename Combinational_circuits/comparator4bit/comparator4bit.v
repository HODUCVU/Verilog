module comparator4bit(w0, w1, less, equal, greater);
    input wire[3:0] w0, w1;
    output reg less, equal, greater;

    always @(w0 or w1) begin
        if(w0 == w1) begin
            less = 0; 
            greater = 0;
            equal = 1;
            end
        else if(w0 > w1) begin
            less = 0;
            greater = 1;
            equal = 0;
            end
        else begin
            less = 1;
            greater = 0;
            equal = 0;
            end
    end
endmodule