`timescale 1ns / 1ps

module tb_fsm_counter_test;
reg clk , reset_n;
reg 		i_run;
reg  [6:0]	i_num_cnt;
wire 		o_idle;
wire 		o_running;
wire 		o_done;
 
// clk gen
always
    #5 clk = ~clk;

initial begin
//initialize value
    reset_n = 1;
    clk     = 0;
    i_run 	= 0;
    i_num_cnt = 0;
	
// reset_n gen
# 100
    reset_n = 0;
# 10
    reset_n = 1;
# 10
    @(posedge clk);
    wait(o_idle);
    i_num_cnt = 7'd100;
    i_run = 1;
    @(posedge clk);
    i_run = 0;
    wait(o_done);
# 100
    $finish;
end

// Call DUT
fsm_counter_test u_fsm_counter_test(
    .clk		(clk),
    .reset_n		(reset_n),
    .i_run		(i_run),
    .i_num_cnt 		(i_num_cnt),
    .o_idle 		(o_idle),
    .o_running 		(o_running),
    .o_done 		(o_done)
    );

endmodule
