`timescale 1ns / 1ps

module tb_arithmetic;

reg clk;	// no use

reg [7:0] value_a;
reg [7:0] value_b;

wire [7:0] w_value_add;
wire [7:0] w_value_sub;
wire [7:0] w_value_mul;
wire [7:0] w_value_div;
 
initial begin
#10
    value_a = 8'd20;
    value_b = 8'd10;
#50
$finish;
end

arithmetic DUT(
    .i_value_a		(value_a),
    .i_value_b		(value_b),
    .o_value_add	(w_value_add),
    .o_value_sub	(w_value_sub),
    .o_value_mul	(w_value_mul),
    .o_value_div	(w_value_div)
);

endmodule
