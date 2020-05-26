// Author:0716049 ,0716009

module ALU_Ctrl(
        funct_i,
        ALUOp_i,
        ALUCtrl_o,
        sra_scr_o,
        fur_slt_o,
        be_o,
        sh_o,
        jump_o,
        RegWrite_o
        );

//I/O ports
input      [6-1:0] funct_i;
input      [3:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;
output     [1:0] fur_slt_o;
output     sra_scr_o;
output     be_o;
output     sh_o;
output     [1:0] jump_o;
output     RegWrite_o;

//Internal Signals
reg        [4-1:0] ALUCtrl_o;
reg        [1:0] fur_slt_o;
reg        sra_scr_o;
reg        be_o;
reg        sh_o;
reg        [1:0] jump_o;
reg        RegWrite_o;
//Select exact operation
always@(*)
begin
        case(ALUOp_i)
                4'b0001://beq
                        begin //0110 . 00 0
                        ALUCtrl_o=4'b0110;
                        //fur_slt_o=2'b00;
                        jump_o=2'b00;
                        RegWrite_o=1'b0;
                        be_o=1'b0;
                        end
                4'b0011://bne
                        begin //0110 . 00 0
                        ALUCtrl_o=4'b0110;
                        //fur_slt_o=2'b00;
                        jump_o=2'b00;
                        RegWrite_o=1'b0;
                        be_o=1'b1;
                        end
                4'b0010://r-type
                        begin
                        case(funct_i)
                                6'b100001://addu
                                        begin
                                        ALUCtrl_o=4'b0010;
                                        fur_slt_o=2'b00;
                                        jump_o=2'b00;
                                        RegWrite_o=1'b1;
                                        end
                                6'b100011://subu
                                        begin // 1001 00 00 1
                                        ALUCtrl_o=4'b1001;
                                        fur_slt_o=2'b00;
                                        jump_o=2'b00;
                                        RegWrite_o=1'b1;
                                        end
                                6'b100100://and
                                        begin // 0000 00 00 1
                                        ALUCtrl_o=4'b0000;
                                        fur_slt_o=2'b00;
                                        jump_o=2'b00;
                                        RegWrite_o=1'b1;
                                        end
                                6'b100101://or
                                        begin // 0001 00 00 1
                                        ALUCtrl_o=4'b0001;
                                        fur_slt_o=2'b00;
                                        jump_o=2'b00;
                                        RegWrite_o=1'b1;
                                        end
                                6'b101010://slt
                                        begin // 0111 00 00 1
                                        ALUCtrl_o=4'b0111;
                                        fur_slt_o=2'b00;
                                        jump_o=2'b00;
                                        RegWrite_o=1'b1;
                                        end
                                6'b000011://sra
                                        begin //. 01 00 1
                                        //ALUCtrl_o=4'b0010;
                                        fur_slt_o=2'b01;
                                        jump_o=2'b00;
                                        RegWrite_o=1'b1;
                                        sra_scr_o=1'b0;
                                        sh_o=1'b0;
                                        end
                                6'b000111://srav
                                        begin // . 01 00 1
                                        //ALUCtrl_o=4'b0010;
                                        fur_slt_o=2'b01;
                                        jump_o=2'b00;
                                        RegWrite_o=1'b1;
                                        sra_scr_o=1'b1;
                                        sh_o=1'b0;
                                        end
                                6'b000000://sll
                                        begin //. 01 00 1
                                        //ALUCtrl_o=4'b0010;
                                        fur_slt_o=2'b01;
                                        jump_o=2'b00;
                                        RegWrite_o=1'b1;
                                        sra_scr_o=1'b0;
                                        sh_o=1'b1;
                                        end
                                6'b011000://mul
                                        begin //1011 00 00 1
                                        ALUCtrl_o=4'b1011;
                                        fur_slt_o=2'b00;
                                        jump_o=2'b00;
                                        RegWrite_o=1'b1;
                                        end
                                6'b001000://jr
                                        begin //. . 10 0
                                        //ALUCtrl_o=4'b0010;
                                        //fur_slt_o=2'b00;
                                        jump_o=2'b10;
                                        RegWrite_o=1'b0;
                                        end
                        endcase
                        end
                4'b0100://addi
                        begin //0010 00  00 1
                        ALUCtrl_o=4'b0010;
                        fur_slt_o=2'b00;
                        jump_o=2'b00;
                        RegWrite_o=1'b1;
                        end
                4'b0110://sltiu
                        begin //1001 00 00 1
                        ALUCtrl_o=4'b1111;
                        fur_slt_o=2'b00;
                        jump_o=2'b00;
                        RegWrite_o=1'b1;
                        end
                4'b0101://ori
                        begin //0001 00 00 1
                        ALUCtrl_o=4'b0001;
                        fur_slt_o=2'b00;
                        jump_o=2'b00;
                        RegWrite_o=1'b1;
                        end
                4'b0111://lui
                        begin //. 10 00 1
                        //ALUCtrl_o=4'b0010;
                        fur_slt_o=2'b10;
                        jump_o=2'b00;
                        RegWrite_o=1'b1;
                        end
                4'b1000://lw
                        begin //0010 . 00 1
                        ALUCtrl_o=4'b0010;
                        //fur_slt_o=2'b00;
                        jump_o=2'b00;
                        RegWrite_o=1'b1;
                        end
                4'b1001://sw
                        begin //0010 . 00 0
                        ALUCtrl_o=4'b0010;
                        //fur_slt_o=2'b00;
                        jump_o=2'b00;
                        RegWrite_o=1'b0;
                        end
                4'b1010://blez
                        begin //0101 . 00 0
                        ALUCtrl_o=4'b1101;
                        //fur_slt_o=2'b00;
                        jump_o=2'b00;
                        RegWrite_o=1'b0;
                        be_o=1'b0;
                        end
                4'b1011://bgtz
                        begin //0101 . 00 0
                        ALUCtrl_o=4'b1101;
                        //fur_slt_o=2'b00;
                        jump_o=2'b00;
                        RegWrite_o=1'b0;
                        be_o=1'b1;
                        end
                4'b1100://j
                        begin //. . 01 0
                        //ALUCtrl_o=4'b0010;
                        //fur_slt_o=2'b00;
                        jump_o=2'b01;
                        RegWrite_o=1'b0;
                        end
                4'b1101://jal
                        begin // . . 01 0
                        //ALUCtrl_o=4'b0010;
                        //fur_slt_o=2'b00;
                        jump_o=2'b01;
                        RegWrite_o=1'b1;
                        end
        endcase
end
endmodule
