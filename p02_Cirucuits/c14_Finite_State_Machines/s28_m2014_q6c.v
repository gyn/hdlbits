//
//
// https://hdlbits.01xz.net/wiki/Exams/m2014_q6b
//
//

`default_nettype none

module top_module (
    input	[5:0]	y,
    input 			w,
    output 			Y1,
    output 			Y3
);

    assign Y1 = y[0] & w;
    assign Y3 = (y[1] & ~w) | (y[2] & ~w) | (y[4] & ~w) | (y[5] & ~w);

    /* verilator lint_off UNUSED */
    wire    [0:0]   unused;
    assign unused = {y[3]};
    /* verilator lint_on UNUSED */

endmodule