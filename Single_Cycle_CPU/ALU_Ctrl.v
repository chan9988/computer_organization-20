// Author:0716049 ,0716009

module ALU_Ctrl(
        funct_i,
        ALUOp_i,
        ALUCtrl_o,
        sra_scr_o,
        fur_slt_o,
        be_o
        );

//I/O ports
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;
output     [1:0] fur_slt_o;
output     sra_scr_o;
output     be_o;

//Internal Signals
reg        [4-1:0] ALUCtrl_o;
reg     [1:0] fur_slt_o;
reg        sra_scr_o;
reg        be_o;

//Select exact operation
always@(*)
begin
        case(ALUOp_i)
                3'b001://beq
                        begin
                        ALUCtrl_o=4'b0110;
                        fur_slt_o=2'b00;
                        be_o=1'b0;
                        end
                3'b011://bne
                        begin
                        ALUCtrl_o=4'b0110;
                        fur_slt_o=2'b00;
                        be_o=1'b1;
                        end
                3'b010://r-type
                        begin
                        case(funct_i)
                                6'b100001://addu
                                        begin
                                        ALUCtrl_o=4'b0010;
                                        fur_slt_o=2'b00;
                                        end
                                6'b100011://subu
                                        begin
                                        ALUCtrl_o=4'b0110;
                                        fur_slt_o=2'b00;
                                        end
                                6'b100100://and
                                        begin 
                                        ALUCtrl_o=4'b0000;
                                        fur_slt_o=2'b00;
                                        end 
                                6'b100101://or
                                        begin 
                                        ALUCtrl_o=4'b0001;
                                        fur_slt_o=2'b00;
                                        end
                                6'b101010://slt
                                        begin 
                                        ALUCtrl_o=4'b0111;
                                        fur_slt_o=2'b00;
                                        end 
                                6'b000011://sra
                                        begin 
                                        sra_scr_o=1'b0;
                                        fur_slt_o=2'b01;
                                        end 
                                6'b000111://srav
                                        begin 
                                        sra_scr_o=1'b1;
                                        fur_slt_o=2'b01;
                                        end
                        endcase
                        end
                3'b100://addi
                        begin
                        ALUCtrl_o=4'b0010;
                        fur_slt_o=2'b00;
                        end
                3'b110://sltiu
                        begin 
                        ALUCtrl_o=4'b1111;
                        fur_slt_o=2'b00;
                        end 
                3'b101://ori
                        begin 
                        ALUCtrl_o=4'b0001;
                        fur_slt_o=2'b00;
                        end 
                3'b111://lu
                        fur_slt_o=2'b10;
        endcase
end
endmodule
