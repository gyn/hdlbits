//
//
// https://hdlbits.01xz.net/wiki/Sim/circuit1
//
//

`default_nettype none

module top_module (
    input   a,
    input   b,
    output  q
);

    //
    //      a
    //
    //  b   q   0   1
    //
    //      0   0   0
    //
    //      1   0   1
    //
    //
    // q = a & b
    //
    //
    assign q = a & b;

endmodule