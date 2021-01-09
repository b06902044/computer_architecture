module IF_ID(
    input [31 : 0]      instr, pc_o,
    input               clk_i, Stall, Flush, cpu_stall_o,
    output reg [31 : 0] IF_ID_IR, IF_ID_PC
);

always @(posedge clk_i) begin
    //if Stall => keep IF / ID register
    if(Stall == 0 && cpu_stall_o == 0) begin
        if(Flush) begin
            IF_ID_IR <= 0;
            IF_ID_PC <= 0;
        end
        else if(instr) begin
            IF_ID_IR <= instr;
            IF_ID_PC <= pc_o;
        end
        else begin
            IF_ID_IR <= 0;
            IF_ID_PC <= 0;
        end     
    end
end

endmodule