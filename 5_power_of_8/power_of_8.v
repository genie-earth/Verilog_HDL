`timescale 1ns / 1ps

module power_of_8(
    input		clk,
    input		reset_n,
    input		i_valid,
    input	[31:0] 	i_value,
    output		o_valid,
    output	[63:0]	o_power_of_8	);
	
    reg 	[2:0] 	r_valid;
    reg 	[63:0] 	r_power_of_2;
    reg 	[63:0] 	r_power_of_4;
    reg 	[63:0] 	r_power_of_8;
    wire 	[63:0] 	power_of_2;
    wire 	[63:0] 	power_of_4;
    wire 	[63:0] 	power_of_8;

// flow of valid
    always @(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            r_valid <= 3'd0;
        end else begin
            r_valid <= {r_valid[1:0], i_valid};		// concatenation of previous valid signal with current valid signal (shift-left)
        end
    end

// data buffer (f/f) 
    always @(posedge clk or negedge reset_n) begin	// connecting data buffer to flip-flop
        if(!reset_n) begin
            r_power_of_2 <= 64'd0;
            r_power_of_4 <= 64'd0;
            r_power_of_8 <= 64'd0;
        end else begin
            r_power_of_2 <= power_of_2;			// first output of multiplier (power_of_2) goes to first input of F/F (r_power_of_2)
            r_power_of_4 <= power_of_4;			// second output of multiplier (power_of_4) goes to second input of F/F (r_power_of_4)
            r_power_of_8 <= power_of_8;			// third output of multiplier (power_of_8) goes to third input of F/F (r_power_of_8)
        end
    end

// Power Operation
    assign power_of_2 = i_value * i_value;		// initial input (i_value) is multplied itself to be first output of multiplier (power_of_2)
    assign power_of_4 = r_power_of_2 * r_power_of_2;	// first output of F/F (r_power_of_2) is multplied itself to be second output of multiplier (power_of_4)
    assign power_of_8 = r_power_of_4 * r_power_of_4;	// second output of F/F (r_power_of_4) is multplied itself to be third output of multiplier (power_of_8)
	
    assign o_valid = r_valid[2];
    assign o_power_of_8 = r_power_of_8;			// third output of FF (r_power_of_8) goes to final output (o_power_of_8)

endmodule
