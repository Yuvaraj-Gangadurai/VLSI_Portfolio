module fifo
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

localparam PTR_WIDTH = $clog2(FIFO_DEPTH);    // paramaterized

reg [DATA_WIDTH-1:0] memory [0:FIFO_DEPTH-1];  // FIFO memory

reg [PTR_WIDTH:0] wr_ptr;                     // write pointer
reg [PTR_WIDTH:0] rd_ptr;                     // read pointer

// Empty Logic
always @(*)
begin
    if (wr_ptr == rd_ptr)
        empty = 1'b1;
    else
        empty = 1'b0;


// Full Logic
always @(*)
begin
    if ((wr_ptr[PTR_WIDTH-1:0] == rd_ptr[PTR_WIDTH-1:0]) && (wr_ptr[PTR_WIDTH] != rd_ptr[PTR_WIDTH]))
        full = 1'b1;
    else
        full = 1'b0;
end

// FIFO Operations
always @(posedge clk)
begin
    if (rst)
    begin
        wr_ptr  <= 0;
        rd_ptr  <= 0;
        rd_data <= 0;
    end
    else
    begin
        // Write operation
        if (wr_en && !full)
        begin
            memory[wr_ptr[PTR_WIDTH-1:0]] <= wr_data;
            wr_ptr <= wr_ptr + 1;
        end

        // Read operation
        if (rd_en && !empty)
        begin
            rd_data <= memory[rd_ptr[PTR_WIDTH-1:0]];
            rd_ptr <= rd_ptr + 1;
        end
    end
end

end

endmodule 