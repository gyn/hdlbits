//
//
// https://hdlbits.01xz.net/wiki/Mt2015_q4a
//
//

`default_nettype none

module top_module (
    input   x,
    input   y,
    output  z
);

    assign z = (x ^ y) & x;

endmodule