`timescale 1ns / 1ps

module tb_clock_generator;
reg 	clk;
reg 	clock_en;
wire 	o_clk;

// 100MHz clk gen
always
    #5 clk = ~clk;
 
initial begin
    clk     	= 0;
	clock_en	= 0;
# 100
	clock_en	= 1;
# 100
	clock_en	= 0;
# 100
$finish;
end

clock_gating_model DUT(
    .i_clk				(clk		),
    .i_clock_en			(clock_en	),
    .o_clk				(o_clk		) 
    );

endmodule