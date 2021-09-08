`timescale 1ns / 1ps

module combinational_0(
    input	[7:0] i_value_a,
    input	[7:0] i_value_b,
    output	[7:0] o_value_add,
    output	[7:0] o_value_sub,
    output	[7:0] o_value_mul,
    output	[7:0] o_value_div	);

    assign o_value_add = i_value_a + i_value_b;
    assign o_value_sub = i_value_a - i_value_b;
    assign o_value_mul = i_value_a * i_value_b;
    assign o_value_div = i_value_a / i_value_b; // If it needs high frequency, it is difficult to synthesis.

endmodule
