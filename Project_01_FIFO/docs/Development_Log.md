# FIFO Development Log

## Day 1

**Date:** 12-07-2026

### Completed

- Installed VS Code
- Installed Verilog extension
- Connected GitHub
- Created project structure
- Created fifo.v
- First Git commit


## Day 2

**Objective**

Create the parameterized FIFO module interface.

### Completed

- Learned about module ports
- Learned the difference between input and output ports
- Added module parameters
- Added FIFO input and output ports
- Understood why parameterized RTL is used

### Concepts Learned

- Module interface
- Parameter
- DATA_WIDTH
- FIFO_DEPTH
- Input ports
- Output ports

## Day 3 - FIFO Core RTL Development

### Implemented
- Added parameterized `DATA_WIDTH`.
- Added parameterized `FIFO_DEPTH`.
- Calculated pointer width using `$clog2(FIFO_DEPTH)`.
- Declared parameterized FIFO memory.
- Added read and write pointers with an extra wrap bit.
- Implemented EMPTY logic.
- Implemented FULL logic.
- Implemented synchronous reset.
- Implemented write operation.
- Implemented read operation.

### Concepts Learned
- Difference between memory address bits and the wrap bit.
- FIFO pointer overflow and circular operation.
- EMPTY condition: `wr_ptr == rd_ptr`.
- FULL condition: same address bits with different wrap bits.
- Read and write operations can occur on the same positive clock edge.
- `empty` and `full` are combinational status signals based on pointer values.

### Current Status
Core FIFO RTL logic has been written. Compilation and simulation are pending because Icarus Verilog is not yet configured.

# Day 4 – RTL Simulation and Verification

## Tasks Completed

- Installed Icarus Verilog on Windows.
- Configured and verified the Icarus Verilog installation.
- Compiled the FIFO RTL successfully.
- Created a Verilog testbench (`fifo_tb.v`).
- Verified basic FIFO write operation.
- Verified FIFO read operation.
- Verified the EMPTY condition.
- Verified the FULL condition by filling all 16 FIFO locations.
- Verified simultaneous write and read operation.
- Confirmed that FIFO data follows the correct First-In First-Out order.
- Added a `.gitignore` file to prevent generated simulation and waveform files from being uploaded to GitHub.
- Updated the FIFO project documentation with `README.md`.

## Simulation Results

### Basic Write and Read

Successfully wrote and read the following values:

```text
10 → 20 → 30 → 40