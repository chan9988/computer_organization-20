//0716049
`timescale 1ns/1ps 

module alu(
           rst_n,         // negative reset            (input)
           src1,          // 32 bits source 1          (input)
           src2,          // 32 bits source 2          (input)
           ALU_control,   // 4 bits ALU control input  (input)
		   bonus_control, // 3 bits bonus control input(input) 
           result,        // 32 bits result            (output)
           zero,          // 1 bit when the output is 0, zero must be set (output)
           cout,          // 1 bit carry out           (output)
           overflow       // 1 bit overflow            (output)
           );


input           rst_n;
input  [32-1:0] src1;
input  [32-1:0] src2;
input   [4-1:0] ALU_control;
input   [3-1:0] bonus_control; 

output [32-1:0] result;
output          zero;
output          cout;
output          overflow;

reg    [32-1:0] result;
reg             zero;
reg             cout;
reg             overflow;

wire [31:0]w;
wire [31:0]r;
wire [31:0]s;
wire equ;
wire le;
wire w1,w2,w3,w4,w5;
reg w6;

//result,ZCV
always@( * )
begin
    if(rst_n==1'b1)
    begin
        result=r;
        zero=!(r[0]|r[1]|r[2]|r[3]|r[4]|r[5]|r[6]|r[7]|r[8]|
               r[9]|r[10]|r[11]|r[12]|r[13]|r[14]|r[15]|r[16]|
               r[17]|r[18]|r[19]|r[20]|r[21]|r[22]|r[23]|r[24]|
               r[25]|r[26]|r[27]|r[28]|r[29]|r[30]|r[31]);
        cout=w[31];
        overflow=w[31]^w[31];
    end
end

alu_top m0(src1[0],src2[0],le,ALU_control[3],ALU_control[2],ALU_control[2],ALU_control[1:0],r[0],w[0]);
alu_top m1(src1[1],src2[1],1'b0,ALU_control[3],ALU_control[2],w[0],ALU_control[1:0],r[1],w[1]);
alu_top m2(src1[2],src2[2],1'b0,ALU_control[3],ALU_control[2],w[1],ALU_control[1:0],r[2],w[2]);
alu_top m3(src1[3],src2[3],1'b0,ALU_control[3],ALU_control[2],w[2],ALU_control[1:0],r[3],w[3]);
alu_top m4(src1[4],src2[4],1'b0,ALU_control[3],ALU_control[2],w[3],ALU_control[1:0],r[4],w[4]);
alu_top m5(src1[5],src2[5],1'b0,ALU_control[3],ALU_control[2],w[4],ALU_control[1:0],r[5],w[5]);
alu_top m6(src1[6],src2[6],1'b0,ALU_control[3],ALU_control[2],w[5],ALU_control[1:0],r[6],w[6]);
alu_top m7(src1[7],src2[7],1'b0,ALU_control[3],ALU_control[2],w[6],ALU_control[1:0],r[7],w[7]);
alu_top m8(src1[8],src2[8],1'b0,ALU_control[3],ALU_control[2],w[7],ALU_control[1:0],r[8],w[8]);
alu_top m9(src1[9],src2[9],1'b0,ALU_control[3],ALU_control[2],w[8],ALU_control[1:0],r[9],w[9]);
alu_top m10(src1[10],src2[10],1'b0,ALU_control[3],ALU_control[2],w[9],ALU_control[1:0],r[10],w[10]);
alu_top m11(src1[11],src2[11],1'b0,ALU_control[3],ALU_control[2],w[10],ALU_control[1:0],r[11],w[11]);
alu_top m12(src1[12],src2[12],1'b0,ALU_control[3],ALU_control[2],w[11],ALU_control[1:0],r[12],w[12]);
alu_top m13(src1[13],src2[13],1'b0,ALU_control[3],ALU_control[2],w[12],ALU_control[1:0],r[13],w[13]);
alu_top m14(src1[14],src2[14],1'b0,ALU_control[3],ALU_control[2],w[13],ALU_control[1:0],r[14],w[14]);
alu_top m15(src1[15],src2[15],1'b0,ALU_control[3],ALU_control[2],w[14],ALU_control[1:0],r[15],w[15]);
alu_top m16(src1[16],src2[16],1'b0,ALU_control[3],ALU_control[2],w[15],ALU_control[1:0],r[16],w[16]);
alu_top m17(src1[17],src2[17],1'b0,ALU_control[3],ALU_control[2],w[16],ALU_control[1:0],r[17],w[17]);
alu_top m18(src1[18],src2[18],1'b0,ALU_control[3],ALU_control[2],w[17],ALU_control[1:0],r[18],w[18]);
alu_top m19(src1[19],src2[19],1'b0,ALU_control[3],ALU_control[2],w[18],ALU_control[1:0],r[19],w[19]);
alu_top m20(src1[20],src2[20],1'b0,ALU_control[3],ALU_control[2],w[19],ALU_control[1:0],r[20],w[20]);
alu_top m21(src1[21],src2[21],1'b0,ALU_control[3],ALU_control[2],w[20],ALU_control[1:0],r[21],w[21]);
alu_top m22(src1[22],src2[22],1'b0,ALU_control[3],ALU_control[2],w[21],ALU_control[1:0],r[22],w[22]);
alu_top m23(src1[23],src2[23],1'b0,ALU_control[3],ALU_control[2],w[22],ALU_control[1:0],r[23],w[23]);
alu_top m24(src1[24],src2[24],1'b0,ALU_control[3],ALU_control[2],w[23],ALU_control[1:0],r[24],w[24]);
alu_top m25(src1[25],src2[25],1'b0,ALU_control[3],ALU_control[2],w[24],ALU_control[1:0],r[25],w[25]);
alu_top m26(src1[26],src2[26],1'b0,ALU_control[3],ALU_control[2],w[25],ALU_control[1:0],r[26],w[26]);
alu_top m27(src1[27],src2[27],1'b0,ALU_control[3],ALU_control[2],w[26],ALU_control[1:0],r[27],w[27]);
alu_top m28(src1[28],src2[28],1'b0,ALU_control[3],ALU_control[2],w[27],ALU_control[1:0],r[28],w[28]);
alu_top m29(src1[29],src2[29],1'b0,ALU_control[3],ALU_control[2],w[28],ALU_control[1:0],r[29],w[29]);
alu_top m30(src1[30],src2[30],1'b0,ALU_control[3],ALU_control[2],w[29],ALU_control[1:0],r[30],w[30]);

//alu_bottom   
assign w1=src1[31]^ALU_control[3];
assign w2=src2[31]^ALU_control[2];
assign w3=w1&w2;
assign w4=w1|w2;
assign w5=w1^w2^w[30];
assign w[31]=(w1&w2)|(w1&w[30])|(w2&w[30]);
assign r[31]=w6;
always@( * )
begin
    case (ALU_control[1:0])
        2'b00: w6=w3; //AND
        2'b01: w6=w4; //OR
        2'b10: w6=w5; //ADD
        2'b11: w6=1'b0; //LESS
    endcase
end

//equal  判斷src1與src2是否相同
assign equ=!((src1[0]^src2[0])|(src1[1]^src2[1])|(src1[2]^src2[2])|(src1[3]^src2[3])|(src1[4]^src2[4])|
             (src1[5]^src2[5])|(src1[6]^src2[6])|(src1[7]^src2[7])|(src1[8]^src2[8])|(src1[9]^src2[9])|
             (src1[10]^src2[10])|(src1[11]^src2[11])|(src1[12]^src2[12])|(src1[13]^src2[13])|(src1[14]^src2[14])|
             (src1[15]^src2[15])|(src1[16]^src2[16])|(src1[17]^src2[17])|(src1[18]^src2[18])|(src1[19]^src2[19])|
             (src1[20]^src2[20])|(src1[21]^src2[21])|(src1[22]^src2[22])|(src1[23]^src2[23])|(src1[24]^src2[24])|
             (src1[25]^src2[25])|(src1[26]^src2[26])|(src1[27]^src2[27])|(src1[28]^src2[28])|(src1[29]^src2[29])|
             (src1[30]^src2[30])|(src1[31]^src2[31]));

//compare.v
compare m32(w5,equ,bonus_control[2:0],le);

endmodule
