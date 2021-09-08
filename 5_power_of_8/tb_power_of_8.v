`timescale 1ns / 1ps

module tb_power_of_8;
reg		clk , reset_n;
reg		i_valid;
reg	[31:0] 	i_value;
wire		o_valid;
wire 	[63:0] 	o_power_of_8;
 
// clk gen
always
    #5 clk = ~clk;

integer i;
integer fd;

initial begin
//initialize value
    reset_n = 1;
    clk     = 0;
    i_valid = 0;
    i_value = 0;

// reset_n gen
# 100
    reset_n = 0;
# 10
    reset_n = 1;
# 10
    @(posedge clk);
    for(i = 0; i < 100; i = i + 1) begin
        @(negedge clk);
        i_valid = 1;
        i_value = i;
        @(posedge clk);
    end
    @(negedge clk);
    i_valid = 0;
    i_value = 0;
# 100
    $finish;
end

// Call DUT
power_of_8 u_power_of_8(
    .clk		(clk),
    .reset_n		(reset_n),
    .i_valid		(i_valid),
    .i_value		(i_value),
    .o_valid		(o_valid),
    .o_power_of_8	(o_power_of_8)
    );
	
endmodule
