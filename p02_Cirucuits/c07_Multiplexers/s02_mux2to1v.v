//
//
// https://hdlbits.01xz.net/wiki/Mux2to1v
//
//

`default_nettype none

module top_module (
    input   [99:0]  a,
    input   [99:0]  b,
    input           sel,
    output  [99:0]  out
);

    assign out = sel ? b : a;

endmodule
