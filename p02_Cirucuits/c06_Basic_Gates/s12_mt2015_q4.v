//
//
// https://hdlbits.01xz.net/wiki/Mt2015_q4
//
//

`default_nettype none

//
// Usually one module in a file is recommended.
//
module mt2015_q4a (
    input   x,
    input   y,
    output  z
);

    assign z = (x ^ y) & x;

endmodule

//
// Usually one module in a file is recommended.
//
module mt2015_q4b (
    input   x,
    input   y,
    output  z
);

    assign z = (x == y);

endmodule

module top_module (
    input   x,
    input   y,
    output  z
);

    wire z0;
    mt2015_q4a mt2015_q4a_i0 (
        .x  ( x     ),
        .y  ( y     ),
        .z  ( z0    )
    );

    wire z1;
    mt2015_q4b mt2015_q4b_i0 (
        .x  ( x     ),
        .y  ( y     ),
        .z  ( z1    )
    );

    wire z2;
    mt2015_q4a mt2015_q4a_i1 (
        .x  ( x     ),
        .y  ( y     ),
        .z  ( z2    )
    );

    wire z3;
    mt2015_q4b mt2015_q4b_i1 (
        .x  ( x     ),
        .y  ( y     ),
        .z  ( z3    )
    );

    assign z = (z0 | z1) ^ (z2 & z3);


endmodule