//
//
// https://hdlbits.01xz.net/wiki/Module
//
//

`default_nettype none

module top_module (
    input   a,
    input   b,
    output  out
);

    mod_a mod_a_u1 (
        .in1    ( a     ),
        .in2    ( b     ),
        .out    ( out   )
    );

endmodule