//
//
// https://hdlbits.01xz.net/wiki/Sim/circuit4
//
//

`default_nettype none

module top_module (
    input   a,
    input   b,
    input   c,
    input   d,
    output  q
);

    //
    //      ab
    //
    //  cd  q   00  01  11  10
    //
    //      00   0   1   1   0
    //
    //      01   0   1   1   0
    //
    //      11   1   1   1   1
    //
    //      10   1   1   1   1
    //
    //
    // q = b | c
    //
    assign q = b | c;

endmodule