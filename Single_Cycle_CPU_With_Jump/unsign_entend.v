// Author:0716049 詹凱傑,0716009 劉冠宏

module Unsign_Extend(
    data_i,
    data_o
    );

//I/O ports
input   [16-1:0] data_i;
output  [32-1:0] data_o;

//Internal Signals
reg     [32-1:0] data_o;

//Sign extended

always @( * )
begin
    data_o[31] = 1'b0;
    data_o[30] = 1'b0;
    data_o[29] = 1'b0;
    data_o[28] = 1'b0;
    data_o[27] = 1'b0;
    data_o[26] = 1'b0;
    data_o[25] = 1'b0;
    data_o[24] = 1'b0;
    data_o[23] = 1'b0;
    data_o[22] = 1'b0;
    data_o[21] = 1'b0;
    data_o[20] = 1'b0;
    data_o[19] = 1'b0;
    data_o[18] = 1'b0;
    data_o[17] = 1'b0;
    data_o[16] = 1'b0;
    data_o[15] = data_i[15];
    data_o[14] = data_i[14];
    data_o[13] = data_i[13];
    data_o[12] = data_i[12];
    data_o[11] = data_i[11];
    data_o[10] = data_i[10];
    data_o[9] = data_i[9];
    data_o[8] = data_i[8];
    data_o[7] = data_i[7];
    data_o[6] = data_i[6];
    data_o[5] = data_i[5];
    data_o[4] = data_i[4];
    data_o[3] = data_i[3];
    data_o[2] = data_i[2];
    data_o[1] = data_i[1];
    data_o[0] = data_i[0];    

end


endmodule
