//
//
// https://hdlbits.01xz.net/wiki/Norgate
//
//

`default_nettype none

module top_module (
    input   a,
    input   b,
    output  out
);

    assign out = ~(a | b);

endmodule