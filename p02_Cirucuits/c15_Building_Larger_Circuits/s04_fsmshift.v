//
//
// https://hdlbits.01xz.net/wiki/exams/review2015_fsmshift
//
//

`default_nettype none

module top_module #(
    parameter           MAX = 4,
    parameter           N = $clog2(MAX + 1)
)(
    input               clk,
    input               reset,
    output              shift_ena
);

    reg     [N - 1:0]   counter;

    always @(posedge clk) begin
        if(reset) begin
            counter <= MAX[N - 1:0];
        end else if (counter != '0)
            counter <= counter - 1'b1;
    end

    assign shift_ena = (counter != '0);

endmodule
