module Sh_L_2_plus_PC_4_bit (
    data0_i,
    data1_i,
    data_o
    );

input [25:0] data0_i;
input [3:0] data1_i;

output [31:0] data_o;

reg [31:0] data_o;

always @( * )
begin
    data_o[31] = data1_i[3];
    data_o[30] = data1_i[2];
    data_o[29] = data1_i[1];
    data_o[28] = data1_i[0];
    data_o[27] = data0_i[25];
    data_o[26] = data0_i[24];
    data_o[25] = data0_i[23];
    data_o[24] = data0_i[22];
    data_o[23] = data0_i[21];
    data_o[22] = data0_i[20];
    data_o[21] = data0_i[19];
    data_o[20] = data0_i[18];
    data_o[19] = data0_i[17];
    data_o[18] = data0_i[16];
    data_o[17] = data0_i[15];
    data_o[16] = data0_i[14];
    data_o[15] = data0_i[13];
    data_o[14] = data0_i[12];
    data_o[13] = data0_i[11];
    data_o[12] = data0_i[10];
    data_o[11] = data0_i[9];
    data_o[10] = data0_i[8];
    data_o[9] = data0_i[7];
    data_o[8] = data0_i[6];
    data_o[7] = data0_i[5];
    data_o[6] = data0_i[4];
    data_o[5] = data0_i[3];
    data_o[4] = data0_i[2];
    data_o[3] = data0_i[1];
    data_o[2] = data0_i[0];
    data_o[1] = 1'b0;
    data_o[0] = 1'b0;
end

endmodule