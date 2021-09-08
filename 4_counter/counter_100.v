`timescale 1ns / 1ps

module counter_100(
    input clk,
    input reset_n,
    output [6:0] o_cnt,
    output [6:0] o_cnt_always	);
	
    reg [6:0] cnt;							// To avoid overflow (range: 0~127)
    always @(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            cnt <= 0;  						// Counting start from zero
        end else if (cnt < 100) begin
            cnt <= cnt + 1;					// Increment whenever clock is postive edge
        end
        // Counting stops when cnt exceeds 100
    end
	
    assign o_cnt = cnt;

    reg [6:0] cnt_always;					// To avoid overflow (range: 0~127) (2^7)
    always @(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            cnt_always <= 0;  				// Counting start from zero
        end else if (cnt_always == 100-1) begin
            cnt_always <= 0; 				// 99 -> 0
        end else begin
            cnt_always <= cnt_always + 1;	// Increment whenever clock is postive edge
        end
    end
	
    assign o_cnt_always = cnt_always;

endmodule
