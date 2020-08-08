//
//
// https://hdlbits.01xz.net/wiki/Sim/circuit3
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
    //      00   0   0   0   0
    //
    //      01   0   1   1   1
    //
    //      11   0   1   1   1
    //
    //      10   0   1   1   1
    //
    //
    // q = (      b      &  d) | 
    //     ( a           &  d) |
    //     (      b &  c     ) |
    //     ( a      &  c     )
    //
    assign q = (      b      &  d) | 
               ( a           &  d) |
               (      b &  c     ) |
               ( a      &  c     );

endmodule