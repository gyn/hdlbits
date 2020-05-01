//
//
// https://hdlbits.01xz.net/wiki/Exams/m2014_q3
//
//

`default_nettype none

module top_module (
    input   [4:1]   x,
    output          f
);

    assign f = (~x[1] & x[3]) | (x[2] & x[4]);

endmodule