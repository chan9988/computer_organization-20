// Author:0716049 ,0716009

module Simple_Single_CPU(
    clk_i,
    rst_i
    );

// Input port
input clk_i;
input rst_i;

wire [31:0]pc_output;
wire [31:0] ins;
wire [2:0] c_aluop;
wire [1:0]c_alusrc;
wire c_regwrite,c_regdst,c_branch;
wire [4:0] rd_src;
wire [31:0]se_output;
wire [31:0] se1;
wire [31:0] se2;
wire [31:0] se3;
wire [31:0] se4;
wire [31:0] reg_out1;
wire [31:0] reg_out2;
wire zero,pc_s;
wire [31:0] result;
wire [31:0] ze;
wire [31:0] sh;
wire [31:0] sh_c1;
wire [4:0] sh_c2;
wire [31:0] wb;
wire c_srascr,c_be;
wire [1:0] c_furslt;
wire [3:0] c_aluctrl;
wire w;
wire [31:0] us_e;

ProgramCounter PC(
    .clk_i( clk_i ),
    .rst_i ( rst_i ),
    .pc_in_i( se4[31:0] ),
    .pc_out_o( pc_output )
    );

Adder Adder1(
    .src1_i( pc_output[31:0] ),
    .src2_i( 4 ),
    .sum_o( se1 )
    );

Instr_Memory IM(
    .pc_addr_i( pc_output[31:0] ),
    .instr_o( ins )
    );

MUX_2to1 #(.size(5)) Mux_Write_Reg(
    .data0_i( ins[20:16] ),
    .data1_i( ins[15:11] ),
    .select_i( c_regdst ),
    .data_o( rd_src )
    );

Reg_File RF(
    .clk_i( clk_i ),
    .rst_i( rst_i ) ,
    .RSaddr_i( ins[25:21] ) ,
    .RTaddr_i( ins[20:16] ) ,
    .RDaddr_i( rd_src[4:0] ) ,
    .RDdata_i( wb[31:0] ) ,
    .RegWrite_i ( c_regwrite ),
    .RSdata_o( reg_out1 ) ,
    .RTdata_o( reg_out2 )
    );

Decoder Decoder(
    .instr_op_i( ins[31:26] ),
    .RegWrite_o( c_regwrite ),
    .ALU_op_o( c_aluop ),
    .ALUSrc_o( c_alusrc ),
    .RegDst_o( c_regdst ),
    .Branch_o( c_branch )
    );

ALU_Ctrl AC(
    .funct_i( ins[5:0] ),
    .ALUOp_i( c_aluop ),
    .ALUCtrl_o( c_aluctrl ),
    .sra_scr_o( c_srascr ),
    .fur_slt_o( c_furslt ),
    .be_o( c_be )
    );

Sign_Extend SE(
    .data_i( ins[15:0] ),
    .data_o( se_output )
    );

MUX_3to1 #(.size(32)) Mux_ALUSrc(
    .data0_i( reg_out2[31:0] ),
    .data1_i( se_output[31:0] ),
    .data2_i( us_e[31:0] ),
    .select_i( c_alusrc ),
    .data_o( sh_c1 )
    );

ALU ALU(
    .src1_i( reg_out1[31:0] ),
    .src2_i( sh_c1[31:0] ),
    .ctrl_i( c_aluctrl[3:0] ),
    .result_o( result ),
    .zero_o( zero )
    );

Adder Adder2(
    .src1_i( se1[31:0] ),
    .src2_i( se2[31:0] ),
    .sum_o( se3 )
    );

Shift_Left_Two_32 Shifter(
    .data_i( se_output[31:0] ),
    .data_o( se2 )
    );

xor m0(w,zero,c_be);
and m1(pc_s,w,c_branch);

MUX_2to1 #(.size(32)) Mux_PC_Source(
    .data0_i( se1[31:0] ),
    .data1_i( se3[31:0] ),
    .select_i( pc_s ),
    .data_o( se4 )
    );

MUX_2to1 #(.size(5)) MUX_sra_src(
    .data0_i( ins[10:6] ),
    .data1_i( reg_out1[4:0] ),
    .select_i( c_srascr ),
    .data_o( sh_c2 )
    );

Zero_filled zero_filled(
    .data_i( ins[15:0] ),
    .data_o( ze )
    );

MUX_3to1 #(.size(32)) MUX_3to1(
    .data0_i( result[31:0] ),
    .data1_i( sh[31:0] ),
    .data2_i( ze[31:0] ),
    .select_i( c_furslt ),
    .data_o( wb )
    );

Shifter shifter(
    .data0_i( sh_c1[31:0] ),
    .data1_i( sh_c2[4:0] ),
    .data_o( sh )
    );   

Unsign_Extend unsign_extend(
    .data_i( ins[15:0] ),
    .data_o( us_e )
);

endmodule
