//
//
// https://hdlbits.01xz.net/wiki/Mt2015_q4b
//
//

`default_nettype none

module top_module (
    input   x,
    input   y,
    output  z
);

    assign z = (x == y);

endmodule