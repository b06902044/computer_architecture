module dcache_sram
(
    // I/O Interface from/to controller
    input               clk_i, rst_i,
    input   [3 : 0]     addr_i,
    input   [24 : 0]    tag_i,
    input   [255 : 0]   data_i,
    input               enable_i, write_i,
    output  [24 : 0]    tag_o,
    output  [255 : 0]   data_o,
    output              hit_o
);

// Memory
reg      [24:0]    tag [0:15][0:1];    
reg      [255:0]   data[0:15][0:1];
reg                LRU [0:15];

integer            i, j;


// Write Data      
// 1. Write hit
// 2. Read miss: Read from memory
always@(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
        for (i=0;i<16;i=i+1) begin
            LRU[i] <= 1'b0;
            for (j=0;j<2;j=j+1) begin
                tag[i][j] <= 25'b0;
                data[i][j] <= 256'b0;
            end
        end
    end
    if(hit_o) begin
        LRU[addr_i] = (ctrl == 2'b00)? 1 : 0;
    end
    if (enable_i && write_i) begin
        // TODO: Handle your write of 2-way associative cache + LRU here
        if(hit_o) begin   //  write hit write at the right place
            tag[addr_i][ctrl] <= tag_i;
            data[addr_i][ctrl] <= data_i; 
        end
        else begin      //  read miss write at the LRU place
            tag[addr_i][LRU[addr_i]] <= tag_i;
            data[addr_i][LRU[addr_i]] <= data_i;
        end
    end
end


// Read Data      
// TODO: tag_o=? data_o=? hit_o=?
wire [1 : 0] ctrl;
Hit Hit (
    .cpu_tag(tag_i), 
    .sram_tag1(tag[addr_i][0]), 
    .sram_tag2(tag[addr_i][1]),
    .ctrl(ctrl)
);

assign hit_o = (ctrl == 2'b10) ? 0 : 1;
assign tag_o =  (ctrl == 2'b10) ? tag[addr_i][LRU[addr_i]] : tag[addr_i][ctrl]; 
assign data_o = (ctrl == 2'b10) ? data[addr_i][LRU[addr_i]] : data[addr_i][ctrl];

endmodule
