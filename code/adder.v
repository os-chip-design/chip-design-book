
module adder (
    input clock,
    input  [7:0] a,
    input  [7:0] b,
    output [7:0] sum
);

    reg [7:0] reg_a, reg_b, reg_sum;

    always @(posedge clock) begin
        reg_a <= a;
        reg_b <= b;
        reg_sum <= reg_a + reg_b;
    end;

    assign sum = reg_sum;

endmodule
