//
//
// https://hdlbits.01xz.net/wiki/Bugs_mux4
//
//

`default_nettype none

module top_module (
    input   [1:0]   sel,
    input   [7:0]   a,
    input   [7:0]   b,
    input   [7:0]   c,
    input   [7:0]   d,
    output  [7:0]   out
);

    wire    [7:0]   mux0;
    wire    [7:0]   mux1;

    mux2 mux_u0 (
        .sel    ( sel[0]    ),
        .a      ( a         ),
        .b      ( b         ),
        .out    ( mux0      )
    );

    mux2 mux_u1 (
        .sel    ( sel[0]    ),
        .a      ( c         ),
        .b      ( d         ),
        .out    ( mux1      )
    );

    mux2 mux_u2 (
        .sel    ( sel[1]    ),
        .a      ( mux0      ),
        .b      ( mux1      ),
        .out    ( out       )
    );

endmodule