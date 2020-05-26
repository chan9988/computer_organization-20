// Author:0716049 詹凱傑,0716009 劉冠宏

module Simple_Single_CPU(
    clk_i,
    rst_i
    );

// Input port
input clk_i;
input rst_i;

wire [31:0]pc_output;
wire [31:0] ins;
wire [3:0] c_aluop;
wire [1:0]c_alusrc;
wire c_regwrite,c_regdst,c_branch;
wire [4:0] rd_src;
wire [31:0]se_output;
wire [31:0] se1;
wire [31:0] se2;
wire [31:0] se3;
wire [31:0] se4;
wire [31:0] se5;
wire [31:0] se6;
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
wire [1:0] c_jump;
wire c_sh,c_mem_read,c_mem_write,c_wb_s;
wire c_reg_write_src,c_reg_dst_src;
wire w;
wire [31:0] us_e;
wire [31:0] wb_s0;
wire [31:0] wb_s1;
wire [31:0] s1;
wire [31:0] s2;
wire [4:0]  s3;

ProgramCounter PC(
    .clk_i( clk_i ),
    .rst_i ( rst_i ),
    .pc_in_i( se6[31:0] ),
    .pc_out_o( pc_output )
    );

Adder Adder1(
    .src1_i( pc_output[31:0] ),
    .src2_i( 4 ),
    .sum_o( se1 )
    );

Adder Adder3(
    .src1_i( pc_output[31:0] ),
    .src2_i( 4 ),
    .sum_o( s1 )
    );

MUX_2to1 #(.size(32)) reg_write_src(
    .data0_i( s1[31:0] ),
    .data1_i( wb ),
    .select_i( c_reg_write_src ),
    .data_o( s2 )
    );

MUX_2to1 #(.size(5)) reg_dst_src(
    .data0_i( ins[15:11] ),
    .data1_i( 5'b11111 ),
    .select_i( c_reg_dst_src ),
    .data_o( s3 )
    );

Instr_Memory IM(
    .pc_addr_i( pc_output[31:0] ),
    .instr_o( ins )
    );

MUX_2to1 #(.size(5)) Mux_Write_Reg(
    .data0_i( ins[20:16] ),
    .data1_i( s3[4:0] ),
    .select_i( c_regdst ),
    .data_o( rd_src )
    );

Reg_File RF(
    .clk_i( clk_i ),
    .rst_i( rst_i ) ,
    .RSaddr_i( ins[25:21] ) ,
    .RTaddr_i( ins[20:16] ) ,
    .RDaddr_i( rd_src[4:0] ) ,
    .RDdata_i( s2[31:0] ) ,
    .RegWrite_i ( c_regwrite ),
    .RSdata_o( reg_out1 ) ,
    .RTdata_o( reg_out2 )
    );

Decoder Decoder(
    .instr_op_i( ins[31:26] ),
    .ALU_op_o( c_aluop ),
    .ALUSrc_o( c_alusrc ),
    .RegDst_o( c_regdst ),
    .Branch_o( c_branch ),
    .Mem_read_o( c_mem_read ),
    .Mem_write_o( c_mem_write ),
    .Reg_write_src_o( c_reg_write_src ),
    .Reg_dst_src_o( c_reg_dst_src ),
    .WB_s_o( c_wb_s )
    );

ALU_Ctrl AC(
    .funct_i( ins[5:0] ),
    .ALUOp_i( c_aluop ),
    .ALUCtrl_o( c_aluctrl ),
    .sra_scr_o( c_srascr ),
    .fur_slt_o( c_furslt ),
    .be_o( c_be ),
    .sh_o( c_sh ),
    .jump_o( c_jump ),
    .RegWrite_o( c_regwrite )
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
    .ctrl( c_aluctrl[3:0] ),
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
    .data_o( wb_s1 )
    );

Shifter shifter(
    .data0_i( sh_c1[31:0] ),
    .data1_i( sh_c2[4:0] ),
    .data2_i( c_sh ),
    .data_o( sh )
    );   

Unsign_Extend unsign_extend(
    .data_i( ins[15:0] ),
    .data_o( us_e )
);

MUX_3to1 #(.size(32)) jump(
    .data0_i( se4[31:0] ),
    .data1_i( se5[31:0] ),
    .data2_i( reg_out1[31:0] ),
    .select_i( c_jump[1:0] ),
    .data_o( se6 )
);

Sh_L_2_plus_PC_4_bit sh_l_2_p_pc_4_b(
    .data0_i( ins[25:0] ),
    .data1_i( se1[31:28] ),
    .data_o( se5 )
);

Data_Memory Data_Memory(
    .clk_i( clk_i ),
	.addr_i( result[31:0] ),
	.data_i( reg_out2[31:0] ),
	.MemRead_i( c_mem_read ),
	.MemWrite_i( c_mem_write ),
	.data_o( wb_s0 )
);

MUX_2to1 #(.size(32))  wb_s(
    .data0_i( wb_s0 ),
    .data1_i( wb_s1 ),
    .select_i( c_wb_s ),
    .data_o( wb )
);

endmodule
