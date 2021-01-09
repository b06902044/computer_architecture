module Hit (
    input [24 : 0]  cpu_tag, sram_tag1, sram_tag2,
    output [1 : 0]  ctrl
);

assign ctrl =   (sram_tag1[24] && cpu_tag[22 : 0] == sram_tag1[22 : 0]) ?    2'b00 : 
                (sram_tag2[24] && cpu_tag[22 : 0] == sram_tag2[22 : 0]) ?    2'b01 : 2'b10;   


endmodule