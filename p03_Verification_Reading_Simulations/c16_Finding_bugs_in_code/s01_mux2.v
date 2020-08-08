//
//
// https://hdlbits.01xz.net/wiki/Bugs_mux2
//
//

`default_nettype none

module top_module (
    input           sel,
    input   [7:0]   a,
    input   [7:0]   b,
    output  [7:0]   out
);

    assign out = sel ? a : b;

endmodule