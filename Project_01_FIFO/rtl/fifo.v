module fifo;
#(
    
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 16
)
(
    input wire clk,
    input wire rst_n,
    input wire wr_en,
    input wire rd_en,
    input wire [DATA_WIDTH-1:0] wr_data,
    output reg [DATA_WIDTH-1:0] rd_data,
    output reg full,
    output reg empty
);
endmodule 