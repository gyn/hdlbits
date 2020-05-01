//
//
// https://hdlbits.01xz.net/wiki/Module_cseladd
//
//

`default_nettype none

module top_module (
    input   [31:0]  a,
    input   [31:0]  b,
    output  [31:0]  sum
);

    wire        cout_lo;
    wire [15:0] sum_lo;
    add16 add16_i0 (
        .a      ( a[15:0]   ),
        .b      ( b[15:0]   ),
        .cin    ( 1'b0      ),
        .sum    ( sum_lo    ),
        .cout   ( cout_lo   )
    );

    wire        unused_cout_hi0;
    wire [15:0] sum_hi0;
    add16 add16_i1 (
        .a      ( a[31:16]          ),
        .b      ( b[31:16]          ),
        .cin    ( 1'b0              ),
        .sum    ( sum_hi0           ),
        .cout   ( unused_cout_hi0   )
    );

    wire        unused_cout_hi1;
    wire [15:0] sum_hi1;
    add16 add16_i2 (
        .a      ( a[31:16]          ),
        .b      ( b[31:16]          ),
        .cin    ( 1'b1              ),
        .sum    ( sum_hi1           ),
        .cout   ( unused_cout_hi1   )
    );

    wire [15:0] sum_hi;
    assign sum_hi = cout_lo ? sum_hi1 : sum_hi0;

    assign sum = {sum_hi, sum_lo};

endmodule