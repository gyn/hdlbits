//
//
// https://hdlbits.01xz.net/wiki/Bcdadd100
//
//

`default_nettype none

module top_module (
    input   [399:0] a,
    input   [399:0] b,
    input           cin,
    output          cout,
    output  [399:0] sum
);

    wire    [100:0] cin_in;

    assign cin_in[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : loop
            bcd_fadd bcd_fadd_i (
                .a      ( a[4 * i + 3 : 4 * i]      ),
                .b      ( b[4 * i + 3 : 4 * i]      ),
                .cin    ( cin_in[i]                 ),
                .cout   ( cin_in[i + 1]             ),
                .sum    ( sum[4 * i + 3 : 4 * i]    )
            );
        end
    endgenerate

    assign cout = cin_in[100];

endmodule