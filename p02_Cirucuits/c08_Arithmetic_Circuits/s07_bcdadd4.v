//
//
// https://hdlbits.01xz.net/wiki/Bcdadd4
//
//

`default_nettype none

module top_module (
    input   [15:0]  a,
    input   [15:0]  b,
    input           cin,
    output          cout,
    output  [15:0]  sum
);

    wire    [4:0] cin_vector;

    assign cin_vector[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : loop
            bcd_fadd bcd_fadd_i (
                .a      ( a[4 * i + 3 : 4 * i]      ),
                .b      ( b[4 * i + 3 : 4 * i]      ),
                .cin    ( cin_vector[i]             ),
                .cout   ( cin_vector[i + 1]         ),
                .sum    ( sum[4 * i + 3 : 4 * i]    )
            );
        end
    endgenerate

    assign cout = cin_vector[4];

endmodule