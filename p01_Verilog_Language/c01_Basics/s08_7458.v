//
//
// https://hdlbits.01xz.net/wiki/7458
//
//

`default_nettype none

module top_module (
    input   p1a,
    input   p1b,
    input   p1c,
    input   p1d,
    input   p1e,
    input   p1f,
    input   p2a,
    input   p2b,
    input   p2c,
    input   p2d,
    output  p1y,
    output  p2y 
);

    assign p1y = (p1a & p1b & p1c) | (p1d & p1e & p1f);

    assign p2y = (p2a & p2b) | (p2c & p2d);

endmodule