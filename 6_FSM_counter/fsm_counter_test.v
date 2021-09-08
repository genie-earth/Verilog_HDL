`timescale 1ns / 1ps

module fsm_counter_test(
    input		clk,
    input		reset_n,
    input		i_run,
    input	[6:0]	i_num_cnt,
    output		o_idle,
    output		o_running,
    output reg		o_done		);

/////// Local Param. to define state ////////
localparam S_IDLE	= 2'b00;
localparam S_RUN	= 2'b01;
localparam S_DONE  	= 2'b10;

/////// Type ////////
reg [1:0] c_state; // Current state  (F/F)
reg [1:0] n_state; // Next state (Variable in Combinational Logic)

wire	  is_done;

/////// Main ////////

// Step 1. always block to update state
always @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
        c_state <= S_IDLE;          // When the reset is first applied, it becomes an IDLE state.
    end else begin
        c_state <= n_state;         // Otherwise, next state becomes current state.
    end
end

// Step 2. always block to compute n_state
//always @(c_state or i_run or is_done)
always @(*) 
begin
    n_state = S_IDLE;               // To prevent latch because if c_state = 2'b11 then n_state tries to save previous state, leading to generate latch.
    case(c_state)
    S_IDLE: if(i_run)
        n_state = S_RUN;            // When the run signal is applied to IDLE state, next state becomes a RUN state.
    S_RUN : if(is_done)
        n_state = S_DONE;           // When the done signal is applied to RUN state, next state becomes a DONE state.
    else 
        n_state = S_RUN;            // To wait is_done.
    S_DONE: n_state = S_IDLE;       // Next state becomes IDLE state after 1 cycle of DONE state.
    endcase
end 

// Step 3.  always block to compute output
//always @(c_state) 
always @(*) // always block to compute output
begin
    o_done = 0;                     // To prevent Latch.
    case(c_state)
    S_DONE: o_done = 1;             // Output o_done becomes 1 during DONE state. (Moore model)
    endcase
end

// Added to communicate with control signals.
assign o_idle 		= (c_state == S_IDLE);      // Output o_idle becomes 1 during IDLE state. (Moore model)
assign o_running 	= (c_state == S_RUN);       // Output o_running becomes 1 during RUN state. (Moore model)
 
// Step 4. Registering (Capture) number of Count
reg [6:0] num_cnt;
always @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
        num_cnt <= 0;
    end else if (i_run) begin
        num_cnt <= i_num_cnt;
    end else if (o_done) begin
        num_cnt <= 0;
    end
end

// Step 5. Core (Counter)
reg [6:0] cnt_always;  
assign is_done = o_running && (cnt_always == num_cnt-1);

always @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
        cnt_always <= 0;  
    end else if (is_done) begin
        cnt_always <= 0; 
    end else if (o_running) begin
        cnt_always <= cnt_always + 1;
    end
end

endmodule
