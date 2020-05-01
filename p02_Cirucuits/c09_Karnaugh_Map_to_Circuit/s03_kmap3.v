//
//
// https://hdlbits.01xz.net/wiki/Kmap3
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

    assign out = ( a               ) |
                 (     ~b &  c     );

    /* verilator lint_off UNUSED */
    wire    [0:0]   unused;
    assign unused = {d};
    /* verilator lint_on UNUSED */

endmodule