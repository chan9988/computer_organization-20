//0716049 詹凱傑

module compare(less,equal,op,out);

input less,equal;
input [2:0]op;
output reg out;

always@( * )
begin
    case (op)
    3'b000: out=less;           //SLT
    3'b001: out=!(less|equal);  //SGT 
    3'b010: out=less|equal;     //SLE 
    3'b011: out=!less;          //SGE 
    3'b110: out=equal;          //SEQ 
    3'b100: out=!equal;         //SNE
    endcase
end

endmodule