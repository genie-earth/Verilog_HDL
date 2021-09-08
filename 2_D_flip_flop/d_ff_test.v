`timescale 1ns / 1ps

module d_ff_test(
    input	clk,
    input	sync_reset,
    input	async_reset,
    input	async_reset_n,
    input	i_value,		// input of D_FF (D)
    output	o_value_sync_reset,
    output	o_value_async_reset,
    output	o_value_async_reset_n,
    output	o_value_mixed_reset,
    output	o_value_no_reset	);

    reg		r_ff_sync_reset;
    reg		r_ff_async_reset;
    reg		r_ff_async_reset_n;
    reg		r_ff_mixed_reset;
    reg		r_ff_no_reset;
	
// D_FF (Sync reset)
    always @ (posedge clk) begin				// opearate regardless of sync_reset
        if(sync_reset) begin   
            r_ff_sync_reset <= 1'b0;
        end else begin
            r_ff_sync_reset <= i_value;
        end
    end
	
// D_FF (Async reset)
    always @ (posedge clk or posedge async_reset) begin		// operate in response to HIGH async_reset
        if(async_reset) begin   
            r_ff_async_reset <= 1'b0;
        end else begin
            r_ff_async_reset <= i_value;
        end
    end

// D_FF (Async reset_n)
    always @ (posedge clk or negedge async_reset_n) begin	// operate in response to LOW async_reset_n
        if(!async_reset_n) begin	// Prefer logical negation
//	if(~async_reset_n) begin   
//	if(async_reset_n == 1'b0) begin   
            r_ff_async_reset_n <= 1'b0;
        end else begin
            r_ff_async_reset_n <= i_value;
        end
    end

// D_FF (Mixed async/sync reset)
    always @ (posedge clk or posedge async_reset) begin		
        if(async_reset) begin		// async reset
            r_ff_mixed_reset <= 1'b0;
        end else if (sync_reset) begin	// sync reset
            r_ff_mixed_reset <= 1'b0;
        end else begin
            r_ff_mixed_reset <= i_value;
        end
    end

// D_FF (No reset)
    always @ (posedge clk) begin
        r_ff_no_reset <= i_value;
    end

// Assign
    assign  o_value_sync_reset		= r_ff_sync_reset;
    assign  o_value_async_reset		= r_ff_async_reset;
    assign  o_value_async_reset_n	= r_ff_async_reset_n;
    assign  o_value_mixed_reset		= r_ff_mixed_reset;
    assign  o_value_no_reset		= r_ff_no_reset;

endmodule
