//
//
// https://hdlbits.01xz.net/wiki/Andgate
//
//

`default_nettype none

module top_module (
    input   a,
    input   b,
    output  out
);

    assign out = a & b;

endmodule