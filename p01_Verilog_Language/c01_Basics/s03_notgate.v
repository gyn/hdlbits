//
//
// https://hdlbits.01xz.net/wiki/Notgate
//
//

`default_nettype none

module top_module (
    input   in,
    output  out
);

    assign out = ~in;

endmodule