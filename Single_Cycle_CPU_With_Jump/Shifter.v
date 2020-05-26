// Author:0716049 詹凱傑,0716009 劉冠宏

module Shifter(
    data0_i,
    data1_i,
    data2_i,
    data_o
    ); 

input signed [31:0] data0_i;
input [4:0] data1_i;
input data2_i;
output signed [31:0] data_o;

reg signed [31:0] data_o;

always @( * )
begin
    case(data2_i)
        1'b0:
            begin
                case (data1_i)
                    5'b00000: data_o = data0_i ;
                    5'b00001: data_o = data0_i>>>1 ;
                    5'b00010: data_o = data0_i>>>2 ;
                    5'b00011: data_o = data0_i>>>3 ;
                    5'b00100: data_o = data0_i>>>4 ;
                    5'b00101: data_o = data0_i>>>5 ;
                    5'b00110: data_o = data0_i>>>6 ;
                    5'b00111: data_o = data0_i>>>7 ;
                    5'b01000: data_o = data0_i>>>8 ;
                    5'b01001: data_o = data0_i>>>9 ;
                    5'b01010: data_o = data0_i>>>10 ;
                    5'b01011: data_o = data0_i>>>11 ;
                    5'b01100: data_o = data0_i>>>12 ;
                    5'b01101: data_o = data0_i>>>13 ;
                    5'b01110: data_o = data0_i>>>14 ;
                    5'b01111: data_o = data0_i>>>15 ;
                    5'b10000: data_o = data0_i>>>16 ;
                    5'b10001: data_o = data0_i>>>17 ;
                    5'b10010: data_o = data0_i>>>18 ; 
                    5'b10011: data_o = data0_i>>>19 ;
                    5'b10100: data_o = data0_i>>>20 ;
                    5'b10101: data_o = data0_i>>>21 ;
                    5'b10110: data_o = data0_i>>>22 ;
                    5'b10111: data_o = data0_i>>>23 ;
                    5'b11000: data_o = data0_i>>>24 ;
                    5'b11001: data_o = data0_i>>>25 ;
                    5'b11010: data_o = data0_i>>>26 ;
                    5'b11011: data_o = data0_i>>>27 ;
                    5'b11100: data_o = data0_i>>>28 ;
                    5'b11101: data_o = data0_i>>>29 ;
                    5'b11110: data_o = data0_i>>>30 ;
                    5'b11111: data_o = data0_i>>>31 ;
                endcase
            end
        1'b1:
            begin
                case (data1_i)
                    5'b00000: data_o = data0_i ;
                    5'b00001: data_o = data0_i<<1 ;
                    5'b00010: data_o = data0_i<<2 ;
                    5'b00011: data_o = data0_i<<3 ;
                    5'b00100: data_o = data0_i<<4 ;
                    5'b00101: data_o = data0_i<<5 ;
                    5'b00110: data_o = data0_i<<6 ;
                    5'b00111: data_o = data0_i<<7 ;
                    5'b01000: data_o = data0_i<<8 ;
                    5'b01001: data_o = data0_i<<9 ;
                    5'b01010: data_o = data0_i<<10 ;
                    5'b01011: data_o = data0_i<<11 ;
                    5'b01100: data_o = data0_i<<12 ;
                    5'b01101: data_o = data0_i<<13 ;
                    5'b01110: data_o = data0_i<<14 ;
                    5'b01111: data_o = data0_i<<15 ;
                    5'b10000: data_o = data0_i<<16 ;
                    5'b10001: data_o = data0_i<<17 ;
                    5'b10010: data_o = data0_i<<18 ; 
                    5'b10011: data_o = data0_i<<19 ;
                    5'b10100: data_o = data0_i<<20 ;
                    5'b10101: data_o = data0_i<<21 ;
                    5'b10110: data_o = data0_i<<22 ;
                    5'b10111: data_o = data0_i<<23 ;
                    5'b11000: data_o = data0_i<<24 ;
                    5'b11001: data_o = data0_i<<25 ;
                    5'b11010: data_o = data0_i<<26 ;
                    5'b11011: data_o = data0_i<<27 ;
                    5'b11100: data_o = data0_i<<28 ;
                    5'b11101: data_o = data0_i<<29 ;
                    5'b11110: data_o = data0_i<<30 ;
                    5'b11111: data_o = data0_i<<31 ;
                endcase
            end
    endcase
        
end

endmodule