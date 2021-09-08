`timescale 1ns / 1ps

module tb_d_ff;

reg clk;
reg clk_enable;
reg sync_reset;
reg async_reset;
reg async_reset_n;

reg i_value;

// clk gen (100MHz)
always
    #5 clk = ~clk;
 
initial begin
    clk     		= 0;
    clk_enable		= 0; // no input clk
    sync_reset		= 0;
    async_reset		= 0;
    async_reset_n 	= 1;
    i_value			= 1;
#50 // Async reset
    sync_reset		= 1;
    async_reset		= 1;
    async_reset_n 	= 0;
#10
    sync_reset		= 0;
    async_reset		= 0;
    async_reset_n 	= 1;
#10 // Input clock
    clk_enable		= 1; // input clk
#10 // Sync reset
    sync_reset		= 1;
#10
    sync_reset		= 0;
#50
$finish;
end
 
wire clk_for_dut = clk && clk_enable;

d_ff_test DUT(
    .clk			(clk_for_dut),
    .sync_reset			(sync_reset),
    .async_reset		(async_reset),
    .async_reset_n		(async_reset_n),
    .i_value			(i_value),
    .o_value_sync_reset		(),
    .o_value_async_reset	(),
    .o_value_async_reset_n	(),
    .o_value_mixed_reset	(),
    .o_value_no_reset		() 
);

endmodule
