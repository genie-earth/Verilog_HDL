`timescale 1ns / 1ps

module clock_gating_model(
    input 	i_clk,	        // 100MHz clock
    input 	i_clock_en, 	// clock providing during HIGH
    output  o_clk
    );

    assign o_clk = i_clk & i_clock_en;	// clock AND gating

endmodule
