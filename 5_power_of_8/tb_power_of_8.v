//////////////////////////////////////////////////////////////////////////////////
// Company: Personal
// Engineer: Matbi / Austin
//
// Create Date:
// Design Name: 
// Module Name: tb_power_of_8
// Project Name:
// Target Devices:
// Tool Versions:
// Description: Verifify module power_of_8
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
module tb_power_of_8;
reg clk , reset_n;
reg 			i_valid;
reg		[31:0] 	i_value;
wire 			o_valid;
wire 	[63:0] 	o_power_of_8;
 
// clk gen
always
    #5 clk = ~clk;

integer i;
integer fd;

initial begin
//initialize value
$display("initialize value [%d]", $time);
    reset_n = 1;
    clk     = 0;
	i_valid = 0;
	i_value = 0;
	fd = $fopen("rtl_v.txt","w"); 
	
// reset_n gen
$display("Reset! [%d]", $time);
# 100
    reset_n = 0;
# 10
    reset_n = 1;
# 10
@(posedge clk);
$display("Start! [%d]", $time);
	for(i=0; i<100; i = i+1) begin
		@(negedge clk);
		i_valid = 1;
		i_value = i;
		@(posedge clk);
	end
	@(negedge clk);
	i_valid = 0;
	i_value = 0;
# 100
$display("Finish! [%d]", $time);
$fclose(fd);
$finish;
end
 
// file write
always @(posedge clk) begin
	if(o_valid) begin
		$fwrite(fd,"result = %0d\n", o_power_of_8);
	end
end


// Call DUT
power_of_8 u_power_of_8(
    .clk (clk),
    .reset_n (reset_n),
	.i_valid (i_valid),
    .i_value (i_value),
	.o_valid (o_valid),
    .o_power_of_8 (o_power_of_8)
    );
endmodule
