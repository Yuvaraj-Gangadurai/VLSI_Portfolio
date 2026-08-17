# Parameterized Synchronous FIFO

## Project Overview

This project implements a parameterized synchronous FIFO (First-In First-Out) buffer using Verilog.

The FIFO supports configurable data width and FIFO depth.

## Parameters

- DATA_WIDTH = 8 bits
- FIFO_DEPTH = 16 locations

## Features

- Synchronous reset
- Write operation
- Read operation
- Empty flag detection
- Full flag detection
- Simultaneous write and read operation
- Parameterized data width
- Parameterized FIFO depth

## Project Structure

```text
Project_01_FIFO/
├── docs/
│   └── README.md
├── rtl/
│   └── fifo.v
├── tb/
│   └── fifo_tb.v
├── waveforms/
└── .gitignore