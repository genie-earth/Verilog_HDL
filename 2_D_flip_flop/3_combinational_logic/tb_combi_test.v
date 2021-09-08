`timescale 1ns / 1ps

module tb_combi_test;

reg clk;

reg [7:0] value_a;
reg [7:0] value_b;

wire [7:0] w_value_add_0;
wire [7:0] w_value_sub_0;
wire [7:0] w_value_mul_0;
wire [7:0] w_value_div_0;

wire [7:0] w_value_add_1;
wire [7:0] w_value_sub_1;
wire [7:0] w_value_mul_1;
wire [7:0] w_value_div_1;

//// clk gen (100 MHz) No use in Combinational Test Case
//always
//    #5 clk = ~clk;
 
initial begin
	$display("initialize value [%d]", $time);
#10
// Make Exceptional Case (Overflow, Signed Operation)
//	value_a = 8'd100; 
//	value_b = 8'd200;

// Easy Case
	value_a = 8'd20;
	value_b = 8'd10;
#50
	$display("Add_0 : %d [%d]", w_value_add_0, $time);
	$display("Sub_0 : %d [%d]", w_value_sub_0, $time);
	$display("Mul_0 : %d [%d]", w_value_mul_0, $time);
	$display("Div_0 : %d [%d]", w_value_div_0, $time);
	$display("Add_1 : %d [%d]", w_value_add_1, $time);
	$display("Sub_1 : %d [%d]", w_value_sub_1, $time);
	$display("Mul_1 : %d [%d]", w_value_mul_1, $time);
	$display("Div_1 : %d [%d]", w_value_div_1, $time);

// Checker
	if(w_value_add_0 !== w_value_add_1) begin
		$display("Mismatch Add [%d]", $time);
	end
	if(w_value_sub_0 !== w_value_sub_1) begin
		$display("Mismatch Sub [%d]", $time);
	end
	if(w_value_mul_0 !== w_value_mul_1) begin
		$display("Mismatch Mul [%d]", $time);
	end
	if(w_value_div_0 !== w_value_div_1) begin
		$display("Mismatch Div [%d]", $time);
	end
	$display("Finish! [%d]", $time);
$finish;
end

combi_test_0 DUT_0(
	.i_value_a		(value_a),
	.i_value_b		(value_b),
    .o_value_add	(w_value_add_0),
    .o_value_sub	(w_value_sub_0),
    .o_value_mul	(w_value_mul_0),
    .o_value_div	(w_value_div_0)
);

combi_test_1 DUT_1(
	.i_value_a		(value_a),
	.i_value_b		(value_b),
    .o_value_add	(w_value_add_1),
    .o_value_sub	(w_value_sub_1),
    .o_value_mul	(w_value_mul_1),
    .o_value_div	(w_value_div_1)
);

endmodule
