//
//
// https://hdlbits.01xz.net/wiki/Module_pos
//
//

`default_nettype none

module top_module (
    input   a,
    input   b,
    input   c,
    input   d,
    output  out1,
    output  out2
);

    mod_a mod_a_i0 (
        out1,
        out2,
        a,
        b,
        c,
        d
    );

endmodule