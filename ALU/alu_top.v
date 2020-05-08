//0716049
`timescale 1ns/1ps

module alu_top(
               src1,       //1 bit source 1 (input)
               src2,       //1 bit source 2 (input)
               less,       //1 bit less     (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               result,     //1 bit result   (output)
               cout       //1 bit carry out(output)
               );

input         src1;
input         src2;
input         less;
input         equal;
input         A_invert;
input         B_invert;
input         cin;
input [2-1:0] operation;

output        result;
output        cout;

reg           result;

wire w1,w2,w3,w4,w5;
assign w1=src1^A_invert;
assign w2=src2^B_invert;
assign w3=w1&w2;
assign w4=w1|w2;
assign w5=w1^w2^cin;
assign cout=(w1&w2)|(w1&cin)|(w2&cin);

always@( * )
begin
    case (operation)
        2'b00: result=w3; //AND
        2'b01: result=w4; //OR
        2'b10: result=w5; //ADD
        2'b11: result=less; //LESS
    endcase
end

endmodule
