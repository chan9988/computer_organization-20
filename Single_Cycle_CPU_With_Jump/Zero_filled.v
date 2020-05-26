// Author:0716049 詹凱傑,0716009 劉冠宏

module Zero_filled (
    data_i,
    data_o
    );

input [15:0] data_i;
output [31:0] data_o;

reg [31:0] data_o;

always @ ( * )
begin
    data_o[31] = data_i[15];
    data_o[30] = data_i[14];
    data_o[29] = data_i[13];
    data_o[28] = data_i[12];
    data_o[27] = data_i[11];
    data_o[26] = data_i[10];
    data_o[25] = data_i[9];
    data_o[24] = data_i[8];
    data_o[23] = data_i[7];
    data_o[22] = data_i[6];    
    data_o[21] = data_i[5];
    data_o[20] = data_i[4];
    data_o[19] = data_i[3];
    data_o[18] = data_i[2];
    data_o[17] = data_i[1];
    data_o[16] = data_i[0];
    data_o[15] = 1'b0;
    data_o[14] = 1'b0;
    data_o[13] = 1'b0;
    data_o[12] = 1'b0;
    data_o[11] = 1'b0;
    data_o[10] = 1'b0;
    data_o[9] = 1'b0;
    data_o[8] = 1'b0;
    data_o[7] = 1'b0;
    data_o[6] = 1'b0;
    data_o[5] = 1'b0;
    data_o[4] = 1'b0;
    data_o[3] = 1'b0;
    data_o[2] = 1'b0;
    data_o[1] = 1'b0;
    data_o[0] = 1'b0;
end

endmodule