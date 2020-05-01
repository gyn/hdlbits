//
//
// https://hdlbits.01xz.net/wiki/Xnorgate
//
//

`default_nettype none

module top_module (
    input   a,
    input   b,
    output  out
);

    assign out = ~(a ^ b);

endmodule