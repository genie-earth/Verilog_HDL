`timescale 1ns / 1ps

module tb_combinational;

reg clk;	// no use

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
 
initial begin
#10
    value_a = 8'd20;
    value_b = 8'd10;
#50
$finish;
end

combinational_0 DUT_0(
    .i_value_a		(value_a),
    .i_value_b		(value_b),
    .o_value_add	(w_value_add_0),
    .o_value_sub	(w_value_sub_0),
    .o_value_mul	(w_value_mul_0),
    .o_value_div	(w_value_div_0)
);

combinational_1 DUT_1(
    .i_value_a		(value_a),
    .i_value_b		(value_b),
    .o_value_add	(w_value_add_1),
    .o_value_sub	(w_value_sub_1),
    .o_value_mul	(w_value_mul_1),
    .o_value_div	(w_value_div_1)
);

endmodule
