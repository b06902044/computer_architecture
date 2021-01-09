module ID_EX(
    input           clk_i, AluSrc, RegWrite, MemtoReg, MemRead, MemWrite,
    input [1 : 0]   AluOp,
    input [2 : 0]   func3,
    input [6 : 0]   func7,
    input [31 : 0]  rd_addr, rs1_addr, rs2_addr, rs1_data, rs2_data, imm_o,
    output reg [31 : 0] ID_EX_RS1data, ID_EX_RS2data, ID_EX_IMM,
    output reg [4 : 0]  ID_EX_RD, ID_EX_RS1, ID_EX_RS2,
    output reg [6 : 0]  ID_EX_func7,
    output reg [2 : 0]  ID_EX_func3,
    output reg [1 : 0]  ID_EX_AluOp,
    output reg          ID_EX_AluSrc, ID_EX_RegWrite, ID_EX_MemtoReg, ID_EX_MemRead, ID_EX_MemWrite
);

always @(posedge clk_i) begin
    if(rd_addr)     ID_EX_RD        <= rd_addr;     else    ID_EX_RD        <= 0;
    if(rs1_addr)    ID_EX_RS1       <= rs1_addr;    else    ID_EX_RS1       <= 0;
    if(rs2_addr)    ID_EX_RS2       <= rs2_addr;    else    ID_EX_RS2       <= 0;
    if (rs1_data)   ID_EX_RS1data   <= rs1_data;    else    ID_EX_RS1data   <= 0;
    if(rs2_data)    ID_EX_RS2data   <= rs2_data;    else    ID_EX_RS2data   <= 0;
    if(imm_o)       ID_EX_IMM       <= imm_o;       else    ID_EX_IMM       <= 0;
    if(func7)       ID_EX_func7     <= func7;       else    ID_EX_func7     <= 0;
    if(func3)       ID_EX_func3     <= func3;       else    ID_EX_func3     <= 0;
    if(AluOp)       ID_EX_AluOp     <= AluOp;       else    ID_EX_AluOp     <= 0;
    if(AluSrc)      ID_EX_AluSrc    <= AluSrc;      else    ID_EX_AluSrc    <= 0;
    if(RegWrite)    ID_EX_RegWrite  <= RegWrite;    else    ID_EX_RegWrite  <= 0;
    if(MemtoReg)    ID_EX_MemtoReg  <= MemtoReg;    else    ID_EX_MemtoReg  <= 0;
    if(MemRead)     ID_EX_MemRead   <= MemRead;     else    ID_EX_MemRead   <= 0;
    if(MemWrite)    ID_EX_MemWrite  <= MemWrite;    else    ID_EX_MemWrite  <= 0;
end


endmodule