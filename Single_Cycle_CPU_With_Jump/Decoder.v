// Author:0716049 詹凱傑,0716009 劉冠宏

module Decoder(
    instr_op_i,
    ALU_op_o,
    ALUSrc_o,
    RegDst_o,
    Branch_o,
    Mem_read_o,
    Mem_write_o,
    Reg_write_src_o,
    Reg_dst_src_o,
    WB_s_o
    );

//I/O ports
input  [6-1:0] instr_op_i;

output [3:0] ALU_op_o;
output [1:0]   ALUSrc_o;
output         RegDst_o;
output         Branch_o;
output         Mem_read_o;
output         Mem_write_o;
output         Reg_write_src_o;
output         Reg_dst_src_o;
output         WB_s_o;


//Internal Signals
reg    [3:0] ALU_op_o;
reg     [1:0]   ALUSrc_o;
reg            RegDst_o;
reg            Branch_o;
reg            Mem_read_o;
reg            Mem_write_o;
reg            Reg_write_src_o;
reg            Reg_dst_src_o;
reg            WB_s_o;

always@(*)
begin
    case(instr_op_i)
        6'b000000://r-type
            begin 
            ALU_op_o=4'b0010;
            ALUSrc_o=2'b00;
            RegDst_o=1'b1;
            Branch_o=1'b0;
            Mem_read_o=1'b0;
            Mem_write_o=1'b0;
            Reg_write_src_o=1'b1;
            Reg_dst_src_o=1'b0;
            WB_s_o=1'b1;
            end 
        6'b100011://LW
            begin 
            ALU_op_o=4'b1000;
            ALUSrc_o=2'b01;
            RegDst_o=1'b0;
            Branch_o=1'b0;
            Mem_read_o=1'b1;
            Mem_write_o=1'b0;
            Reg_write_src_o=1'b1;
            Reg_dst_src_o=1'b0;
            WB_s_o=1'b0;
            end 
        6'b101011://SW
            begin
            ALU_op_o=4'b1001;
            ALUSrc_o=2'b01;
            //RegDst_o=1'b1;
            Branch_o=1'b0;
            Mem_read_o=1'b0;
            Mem_write_o=1'b1;
            Reg_write_src_o=1'b1;
            Reg_dst_src_o=1'b0;
            //WB_s_o=1'b1;
            end 
        6'b000110://blez
            begin //1010 00 . 1 0 0 1 0 .
            ALU_op_o=4'b1010;
            ALUSrc_o=2'b00;
            //RegDst_o=1'b1;
            Branch_o=1'b1;
            Mem_read_o=1'b0;
            Mem_write_o=1'b0;
            Reg_write_src_o=1'b1;
            Reg_dst_src_o=1'b0;
            //WB_s_o=1'b1;
            end 
        6'b000111://bgtz
            begin //1011 00 . 1 0 0 1 0 .
            ALU_op_o=4'b1011;
            ALUSrc_o=2'b00;
            //RegDst_o=1'b1;
            Branch_o=1'b1;
            Mem_read_o=1'b0;
            Mem_write_o=1'b0;
            Reg_write_src_o=1'b1;
            Reg_dst_src_o=1'b0;
            //WB_s_o=1'b1;
            end 
        6'b000010://j
            begin //1100 . . 0 0 0 1 0 .
            ALU_op_o=4'b1100;
            //ALUSrc_o=2'b00;
            //RegDst_o=1'b1;
            Branch_o=1'b0;
            Mem_read_o=1'b0;
            Mem_write_o=1'b0;
            Reg_write_src_o=1'b1;
            Reg_dst_src_o=1'b0;
            //WB_s_o=1'b1;
            end
        6'b000011://jal
            begin //1101 . 1 0 0 0 0 1 .
            ALU_op_o=4'b1101;
            //ALUSrc_o=2'b00;
            RegDst_o=1'b1;
            Branch_o=1'b0;
            Mem_read_o=1'b0;
            Mem_write_o=1'b0;
            Reg_write_src_o=1'b0;
            Reg_dst_src_o=1'b1;
            //WB_s_o=1'b1;
            end  
        6'b001000://addi
            begin //0100 01 0 0 0 0 1 0 1
            ALU_op_o=4'b0100;
            ALUSrc_o=2'b01;
            RegDst_o=1'b0;
            Branch_o=1'b0;
            Mem_read_o=1'b0;
            Mem_write_o=1'b0;
            Reg_write_src_o=1'b1;
            Reg_dst_src_o=1'b0;
            WB_s_o=1'b1;
            end 
        6'b001011://sltiu
            begin //0110 11 0 0 0 0 1 0 1
            ALU_op_o=4'b0110;
            ALUSrc_o=2'b10;
            RegDst_o=1'b0;
            Branch_o=1'b0;
            Mem_read_o=1'b0;
            Mem_write_o=1'b0;
            Reg_write_src_o=1'b1;
            Reg_dst_src_o=1'b0;
            WB_s_o=1'b1;
            end 
        6'b000100://beq
            begin //0001 00 . 1 0 0 1 0 .
            ALU_op_o=4'b0001;
            ALUSrc_o=2'b00;
            //RegDst_o=1'b1;
            Branch_o=1'b1;
            Mem_read_o=1'b0;
            Mem_write_o=1'b0;
            Reg_write_src_o=1'b1;
            Reg_dst_src_o=1'b0;
            //WB_s_o=1'b1;
            end 
        6'b001111://lui
            begin //0111 . 0 0 0 0 1 0 1
            ALU_op_o=4'b0111;
            //ALUSrc_o=2'b00;
            RegDst_o=1'b0;
            Branch_o=1'b0;
            Mem_read_o=1'b0;
            Mem_write_o=1'b0;
            Reg_write_src_o=1'b1;
            Reg_dst_src_o=1'b0;
            WB_s_o=1'b1;
            end 
        6'b001101://ori
            begin // 0101 01 0 0 0 0 1 0 1
            ALU_op_o=4'b0101;
            ALUSrc_o=2'b10;
            RegDst_o=1'b0;
            Branch_o=1'b0;
            Mem_read_o=1'b0;
            Mem_write_o=1'b0;
            Reg_write_src_o=1'b1;
            Reg_dst_src_o=1'b0;
            WB_s_o=1'b1;
            end  
        6'b000101://bne
            begin //0011 00 . 1 0 0 1 0 .
            ALU_op_o=4'b0011;
            ALUSrc_o=2'b00;
            //RegDst_o=1'b1;
            Branch_o=1'b1;
            Mem_read_o=1'b0;
            Mem_write_o=1'b0;
            Reg_write_src_o=1'b1;
            Reg_dst_src_o=1'b0;
            //WB_s_o=1'b1;
            end 
    endcase
end


endmodule
