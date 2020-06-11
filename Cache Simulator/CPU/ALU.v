// Author:0716049 ,0716009

module ALU(
        //   rst_n,         // negative reset            (input)
           src1_i,          // 32 bits source 1          (input)
           src2_i,          // 32 bits source 2          (input)
           ctrl,   // 4 bits ALU control input  (input)
		//  bonus_control, // 3 bits bonus control input(input) 
           result_o,        // 32 bits result            (output)
           zero_o         // 1 bit when the output is 0, zero must be set (output)
        //   cout,          // 1 bit carry out           (output)
        //   overflow       // 1 bit overflow            (output)
           );


//input           rst_n;
input  [32-1:0] src1_i;
input  [32-1:0] src2_i;
input   [4-1:0] ctrl;
//input   [3-1:0] bonus_control; 

output [32-1:0] result_o;
output          zero_o;
//output          cout;
//output          overflow;

reg    [32-1:0] result_o;
reg             zero_o;
//reg             cout;
//reg             overflow;

wire [31:0]w;
wire [31:0]r;
wire [31:0]s;
wire equ;
wire le;
wire w1,w2,w3,w4,w5;
reg w6;
reg [3:0] ctrl_i;
wire [31:0]uslt;
wire w7;

assign uslt=src1_i<src2_i ? 32'b1:32'b0;
assign w7=src1_i==32'b0 ? 1'b1:1'b0;

always@( * )
begin
    case(ctrl)
        4'b1101: ctrl_i=4'b1101;
        default: ctrl_i=ctrl;
    endcase
end


//result,ZCV
always@( * )
begin
    //if(rst_n==1'b1)
    //begin
        case (ctrl_i[3])
            1'b0:
                begin
                    result_o=r;
                    zero_o=!(r[0]|r[1]|r[2]|r[3]|r[4]|r[5]|r[6]|r[7]|r[8]|
                        r[9]|r[10]|r[11]|r[12]|r[13]|r[14]|r[15]|r[16]|
                        r[17]|r[18]|r[19]|r[20]|r[21]|r[22]|r[23]|r[24]|
                        r[25]|r[26]|r[27]|r[28]|r[29]|r[30]|r[31]);
                        //cout=w[31];
                        //overflow=w[31]^w[31]; 
                end
            1'b1:
                begin
                    case (ctrl_i[2:0])
                        3'b111: result_o = uslt; 
                        3'b001: result_o = src1_i-src2_i;
                        3'b101: zero_o = src1_i[31]|w7 ;
                        3'b011: result_o = src1_i * src2_i;
                    endcase
                end
        endcase
    //end
end


alu_top m0(src1_i[0],src2_i[0],w5,ctrl_i[3],ctrl_i[2],ctrl_i[2],ctrl_i[1:0],r[0],w[0]);
alu_top m1(src1_i[1],src2_i[1],1'b0,ctrl_i[3],ctrl_i[2],w[0],ctrl_i[1:0],r[1],w[1]);
alu_top m2(src1_i[2],src2_i[2],1'b0,ctrl_i[3],ctrl_i[2],w[1],ctrl_i[1:0],r[2],w[2]);
alu_top m3(src1_i[3],src2_i[3],1'b0,ctrl_i[3],ctrl_i[2],w[2],ctrl_i[1:0],r[3],w[3]);
alu_top m4(src1_i[4],src2_i[4],1'b0,ctrl_i[3],ctrl_i[2],w[3],ctrl_i[1:0],r[4],w[4]);
alu_top m5(src1_i[5],src2_i[5],1'b0,ctrl_i[3],ctrl_i[2],w[4],ctrl_i[1:0],r[5],w[5]);
alu_top m6(src1_i[6],src2_i[6],1'b0,ctrl_i[3],ctrl_i[2],w[5],ctrl_i[1:0],r[6],w[6]);
alu_top m7(src1_i[7],src2_i[7],1'b0,ctrl_i[3],ctrl_i[2],w[6],ctrl_i[1:0],r[7],w[7]);
alu_top m8(src1_i[8],src2_i[8],1'b0,ctrl_i[3],ctrl_i[2],w[7],ctrl_i[1:0],r[8],w[8]);
alu_top m9(src1_i[9],src2_i[9],1'b0,ctrl_i[3],ctrl_i[2],w[8],ctrl_i[1:0],r[9],w[9]);
alu_top m10(src1_i[10],src2_i[10],1'b0,ctrl_i[3],ctrl_i[2],w[9],ctrl_i[1:0],r[10],w[10]);
alu_top m11(src1_i[11],src2_i[11],1'b0,ctrl_i[3],ctrl_i[2],w[10],ctrl_i[1:0],r[11],w[11]);
alu_top m12(src1_i[12],src2_i[12],1'b0,ctrl_i[3],ctrl_i[2],w[11],ctrl_i[1:0],r[12],w[12]);
alu_top m13(src1_i[13],src2_i[13],1'b0,ctrl_i[3],ctrl_i[2],w[12],ctrl_i[1:0],r[13],w[13]);
alu_top m14(src1_i[14],src2_i[14],1'b0,ctrl_i[3],ctrl_i[2],w[13],ctrl_i[1:0],r[14],w[14]);
alu_top m15(src1_i[15],src2_i[15],1'b0,ctrl_i[3],ctrl_i[2],w[14],ctrl_i[1:0],r[15],w[15]);
alu_top m16(src1_i[16],src2_i[16],1'b0,ctrl_i[3],ctrl_i[2],w[15],ctrl_i[1:0],r[16],w[16]);
alu_top m17(src1_i[17],src2_i[17],1'b0,ctrl_i[3],ctrl_i[2],w[16],ctrl_i[1:0],r[17],w[17]);
alu_top m18(src1_i[18],src2_i[18],1'b0,ctrl_i[3],ctrl_i[2],w[17],ctrl_i[1:0],r[18],w[18]);
alu_top m19(src1_i[19],src2_i[19],1'b0,ctrl_i[3],ctrl_i[2],w[18],ctrl_i[1:0],r[19],w[19]);
alu_top m20(src1_i[20],src2_i[20],1'b0,ctrl_i[3],ctrl_i[2],w[19],ctrl_i[1:0],r[20],w[20]);
alu_top m21(src1_i[21],src2_i[21],1'b0,ctrl_i[3],ctrl_i[2],w[20],ctrl_i[1:0],r[21],w[21]);
alu_top m22(src1_i[22],src2_i[22],1'b0,ctrl_i[3],ctrl_i[2],w[21],ctrl_i[1:0],r[22],w[22]);
alu_top m23(src1_i[23],src2_i[23],1'b0,ctrl_i[3],ctrl_i[2],w[22],ctrl_i[1:0],r[23],w[23]);
alu_top m24(src1_i[24],src2_i[24],1'b0,ctrl_i[3],ctrl_i[2],w[23],ctrl_i[1:0],r[24],w[24]);
alu_top m25(src1_i[25],src2_i[25],1'b0,ctrl_i[3],ctrl_i[2],w[24],ctrl_i[1:0],r[25],w[25]);
alu_top m26(src1_i[26],src2_i[26],1'b0,ctrl_i[3],ctrl_i[2],w[25],ctrl_i[1:0],r[26],w[26]);
alu_top m27(src1_i[27],src2_i[27],1'b0,ctrl_i[3],ctrl_i[2],w[26],ctrl_i[1:0],r[27],w[27]);
alu_top m28(src1_i[28],src2_i[28],1'b0,ctrl_i[3],ctrl_i[2],w[27],ctrl_i[1:0],r[28],w[28]);
alu_top m29(src1_i[29],src2_i[29],1'b0,ctrl_i[3],ctrl_i[2],w[28],ctrl_i[1:0],r[29],w[29]);
alu_top m30(src1_i[30],src2_i[30],1'b0,ctrl_i[3],ctrl_i[2],w[29],ctrl_i[1:0],r[30],w[30]);

//alu_bottom   
assign w1=src1_i[31]^ctrl_i[3];
assign w2=src2_i[31]^ctrl_i[2];
assign w3=w1&w2;
assign w4=w1|w2;
assign w5=w1^w2^w[30];
assign w[31]=(w1&w2)|(w1&w[30])|(w2&w[30]);
assign r[31]=w6;
always@( * )
begin
    case (ctrl_i[1:0])
        2'b00: w6=w3; //AND
        2'b01: w6=w4; //OR
        2'b10: w6=w5; //ADD
        2'b11: w6=1'b0; //LESS
    endcase
end

//equal  判斷src1與src2是否相同
/*
assign equ=!((src1[0]^src2[0])|(src1[1]^src2[1])|(src1[2]^src2[2])|(src1[3]^src2[3])|(src1[4]^src2[4])|
             (src1[5]^src2[5])|(src1[6]^src2[6])|(src1[7]^src2[7])|(src1[8]^src2[8])|(src1[9]^src2[9])|
             (src1[10]^src2[10])|(src1[11]^src2[11])|(src1[12]^src2[12])|(src1[13]^src2[13])|(src1[14]^src2[14])|
             (src1[15]^src2[15])|(src1[16]^src2[16])|(src1[17]^src2[17])|(src1[18]^src2[18])|(src1[19]^src2[19])|
             (src1[20]^src2[20])|(src1[21]^src2[21])|(src1[22]^src2[22])|(src1[23]^src2[23])|(src1[24]^src2[24])|
             (src1[25]^src2[25])|(src1[26]^src2[26])|(src1[27]^src2[27])|(src1[28]^src2[28])|(src1[29]^src2[29])|
             (src1[30]^src2[30])|(src1[31]^src2[31]));
*/
//compare.v
//compare m32(w5,equ,bonus_control[2:0],le);

endmodule
