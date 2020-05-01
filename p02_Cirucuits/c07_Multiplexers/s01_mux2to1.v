//
//
// https://hdlbits.01xz.net/wiki/Mux2to1
//
//

`default_nettype none

module top_module (
    input   a,
    input   b,
    input   sel,
    output  out
);

    assign out = sel ? b : a;

endmodule
