`timescale 1ns / 1ps

module arithmetic(
    input	[7:0] i_value_a,
    input	[7:0] i_value_b,
    output	[7:0] o_value_add,
    output	[7:0] o_value_sub,
    output	[7:0] o_value_mul,
    output	[7:0] o_value_div	);

    reg  [7:0] r_value_add;
    reg  [7:0] r_value_sub;
    reg  [7:0] r_value_mul;
    reg  [7:0] r_value_div;

    always @(*) begin
        r_value_add = i_value_a + i_value_b;
        r_value_sub = i_value_a - i_value_b;
        r_value_mul = i_value_a * i_value_b;
        r_value_div = i_value_a / i_value_b;
    end

    assign o_value_add = r_value_add;
    assign o_value_sub = r_value_sub;
    assign o_value_mul = r_value_mul;
    assign o_value_div = r_value_div;

endmodule
