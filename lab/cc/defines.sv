`timescale 5ns/1ps

`define TIME_PERIOD 10

`define SYS_BUS_WIDTH 32

`define LOG2_BLOCK_SIZE 6
`define BLOCK_SIZE (1 << `LOG2_BLOCK_SIZE)

`define LOG2_NUM_LINES 6
`define NUM_LINES (1 << `LOG2_NUM_LINES)

`define TAG_WIDTH (`SYS_BUS_WIDTH - `LOG2_NUM_LINES - `LOG2_BLOCK_SIZE)

`define VALID 1
`define MODIFIED 0
