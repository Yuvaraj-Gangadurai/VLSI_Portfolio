`timescale 1ns/1ps

module fifo_tb;

    // Parameters
    parameter DATA_WIDTH = 8;
    parameter FIFO_DEPTH = 16;

    // Testbench signals
    reg clk;
    reg rst;
    reg wr_en;
    reg rd_en;
    reg [DATA_WIDTH-1:0] wr_data;

    wire [DATA_WIDTH-1:0] rd_data;
    wire full;
    wire empty;


    // Instantiate FIFO
    fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .FIFO_DEPTH(FIFO_DEPTH)
    ) dut (
        .clk(clk),
        .rst_n(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .wr_data(wr_data),
        .rd_data(rd_data),
        .full(full),
        .empty(empty)
    );


    // Clock generation
    always #5 clk = ~clk;


    // Test sequence
    initial begin

    // Initial values
        clk     = 0;
        rst     = 1;
        wr_en   = 0;
        rd_en   = 0;
        wr_data = 0;

    // Reset
        #10;
        rst = 0;

        // Write 10
        #10;
        wr_en   = 1;
        wr_data = 8'd10;

        // Write 20
        #10;
        wr_data = 8'd20;

        // Stop writing
        #10;
        wr_en = 0;

        // Simultaneous Write + Read
        #10;
        wr_en   = 1;
        rd_en   = 1;
        wr_data = 8'd30;

        // Continue simultaneous Write + Read
        #10;
        wr_data = 8'd40;

        #10;
        wr_data = 8'd50;

        // Stop both operations
        #10;
        wr_en = 0;
        rd_en = 0;

        #20;
        $finish;
    end
    


    // Display FIFO activity
    initial begin
        $monitor(
            "Time=%0t | rst=%b | wr_en=%b | rd_en=%b | wr_data=%d | rd_data=%d | full=%b | empty=%b",
            $time, rst, wr_en, rd_en, wr_data, rd_data, full, empty
        );
    end


    // Waveform dump
    initial begin
        $dumpfile("fifo_wave.vcd");
        $dumpvars(0, fifo_tb);
    end

endmodule