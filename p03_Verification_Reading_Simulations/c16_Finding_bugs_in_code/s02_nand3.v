//
//
// https://hdlbits.01xz.net/wiki/Bugs_nand3
//
//

`default_nettype none

module top_module (
    input       a,
    input       b,
    input       c,
    output      out
);

    wire        and_out;

    andgate inst1 (
        .a      ( a         ),
        .b      ( b         ),
        .c      ( c         ),
        .d      ( 1'b1      ),
        .e      ( 1'b1      ),
        .out    ( and_out   )
    );

    assign out = !and_out;

endmodule