// Author:0716049 ,0716009

module Decoder(
    instr_op_i,
    RegWrite_o,
    ALU_op_o,
    ALUSrc_o,
    RegDst_o,
    Branch_o
    );

//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output [1:0]   ALUSrc_o;
output         RegDst_o;
output         Branch_o;

//Internal Signals
reg    [3-1:0] ALU_op_o;
reg     [1:0]   ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;

always@(*)
begin
    case(instr_op_i)
        6'b000000://r-type
            begin 
            RegWrite_o=1'b1;
            ALU_op_o=3'b010;
            ALUSrc_o=2'b00;
            RegDst_o=1'b1;
            Branch_o=1'b0;
            end 
        6'b001000://addi
            begin 
            RegWrite_o=1'b1;
            ALU_op_o=3'b100;
            ALUSrc_o=2'b01;
            RegDst_o=1'b0;
            Branch_o=1'b0;
            end 
        6'b001011://sltiu
            begin 
            RegWrite_o=1'b1;
            ALU_op_o=3'b110;
            ALUSrc_o=2'b10;
            RegDst_o=1'b0;
            Branch_o=1'b0;
            end 
        6'b000100://beq
            begin 
            RegWrite_o=1'b0;
            ALU_op_o=3'b001;
            ALUSrc_o=2'b00;
            RegDst_o=1'b1;
            Branch_o=1'b1;
            end 
        6'b001111://lui
            begin 
            RegWrite_o=1'b1;
            ALU_op_o=3'b111;
            ALUSrc_o=2'b00;
            RegDst_o=1'b0;
            Branch_o=1'b0;
            end 
        6'b001101://ori
            begin 
            RegWrite_o=1'b1;
            ALU_op_o=3'b101;
            ALUSrc_o=2'b10;
            RegDst_o=1'b0;
            Branch_o=1'b0;
            end 
        6'b000101://bne
            begin 
            RegWrite_o=1'b0;
            ALU_op_o=3'b011;
            ALUSrc_o=2'b00;
            RegDst_o=1'b1;
            Branch_o=1'b1;
            end
    endcase
end


endmodule
