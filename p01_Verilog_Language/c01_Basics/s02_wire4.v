//
//
// https://hdlbits.01xz.net/wiki/Wire4
//
//

`default_nettype none

module top_module (
    input   a,
    input   b,
    input   c,
    output  w,
    output  x,
    output  y,
    output  z
);

    assign w = a;
    assign x = b;
    assign y = b;
    assign z = c;

endmodule