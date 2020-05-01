//
//
// https://hdlbits.01xz.net/wiki/Kmap2
//
//

`default_nettype none

module top_module (
    input   a,
    input   b,
    input   c,
    input   d,
    output  out
); 

    assign out = (~a &           ~d) |
                 (     ~b & ~c     ) |
                 (~a &  b &  c     ) |
                 ( a &    &  c &  d);

endmodule