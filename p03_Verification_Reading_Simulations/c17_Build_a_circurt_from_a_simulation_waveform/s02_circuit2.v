//
//
// https://hdlbits.01xz.net/wiki/Sim/circuit2
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
    //      00   1   0   1   0
    //
    //      01   0   1   0   1
    //
    //      11   1   0   1   0
    //
    //      10   0   1   0   1
    //
    //
    // q = (~a & ~b & ~c & ~d) | 
    //     (~a & ~b &  c &  d) |
    //     (~a &  b & ~c &  d) |
    //     (~a &  b &  c & ~d) |
    //     ( a &  b & ~c & ~d) |
    //     ( a &  b &  c &  d) |
    //     ( a & ~b & ~c &  d) |
    //     ( a & ~b &  c & ~d)
    //
    assign q = (~a & ~b & ~c & ~d) | 
               (~a & ~b &  c &  d) |
               (~a &  b & ~c &  d) |
               (~a &  b &  c & ~d) |
               ( a &  b & ~c & ~d) |
               ( a &  b &  c &  d) |
               ( a & ~b & ~c &  d) |
               ( a & ~b &  c & ~d);

endmodule