//
//
// https://hdlbits.01xz.net/wiki/Module_shift
//
//

`default_nettype none

module top_module (
    input   clk,
    input   d,
    output  q
);

    wire q0;
    my_dff my_dff_i0 (
        .clk    ( clk   ),
        .d      ( d     ),
        .q      ( q0    )
    );

    wire q1;
    my_dff my_dff_i1 (
        .clk    ( clk   ),
        .d      ( q0    ),
        .q      ( q1    )
    );

    my_dff my_dff_i2 (
        .clk    ( clk   ),
        .d      ( q1    ),
        .q      ( q     )
    );

endmodule