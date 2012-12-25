`timescale 10ns/10ps

`define TIME_PERIOD 10

`define ADDR_BUS_WIDTH 13

`define LOG2_LINE_SIZE 6
`define LINE_SIZE (1 << `LOG2_LINE_SIZE)

`define LOG2_NUM_LINES 6
`define NUM_LINES (1 << `LOG2_NUM_LINES)

`define TAG_WIDTH (`ADDR_BUS_WIDTH - `LOG2_NUM_LINES - `LOG2_LINE_SIZE)

`define URND unsigned' ($random)

typedef enum logic [1:0] {INVALID, SHARED, EXCLUSIVE, MODIFIED} line_state_t;

typedef enum logic {READ, WRITE} opr_t;

typedef enum logic [2:0] {
        NT,     // No Transfer
        F_RB,   // Flush        -> Read & Broadcast
        F_R,    // Flush        -> Read
        B_RB,   // Broadcast    -> Read & Broadcast
        B_R,    // Broadcast    -> Read
        RB,     // Read & Broadcast
        R,      // Read
        B       // Broadcast
} transfer_t;

typedef enum logic [2:0] {
        NB,     // No Broadcast
        IVDATE, // invalidate
        RTM,    // Reading to Modify
        ISL,    // Invalidating Shared Line
        RD      // Reading
} broadcast_t;
