//
//
// https://hdlbits.01xz.net/wiki/Module_addsub
//
//

`default_nettype none

module top_module (
    input  [31:0]   a,
    input  [31:0]   b,
    input           sub,
    output [31:0]   sum
);

    wire [31:0] xored_b;
    assign xored_b = b ^ {32{sub}};

    wire cout_lo;
    add16 add16_i0 (
        .a      ( a[15:0]       ),
        .b      ( xored_b[15:0] ),
        .cin    ( sub           ),
        .sum    ( sum[15:0]     ),
        .cout   ( cout_lo       )
    );

    wire unused_cout_hi;
    add16 add16_i1 (
        .a      ( a[31:16]          ),
        .b      ( xored_b[31:16]    ),
        .cin    ( cout_lo           ),
        .sum    ( sum[31:16]        ),
        .cout   ( unused_cout_hi    )
    );

endmodule