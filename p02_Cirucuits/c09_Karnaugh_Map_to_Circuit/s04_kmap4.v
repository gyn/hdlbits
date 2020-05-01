//
//
// https://hdlbits.01xz.net/wiki/Kmap4
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

    assign out = (~a &  b & ~c & ~d) |
                 ( a & ~b & ~c & ~d) |
                 (~a & ~b & ~c &  d) |
                 ( a &  b & ~c &  d) |
                 (~a &  b &  c &  d) |
                 ( a & ~b &  c &  d) |
                 (~a & ~b &  c & ~d) |
                 ( a &  b &  c & ~d);

endmodule