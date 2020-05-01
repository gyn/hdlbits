//
//
// https://hdlbits.01xz.net/wiki/Adder3
//
//

`default_nettype none

//
// Usually one module in a file is recommended.
//
module fadd (
    input   a,
    input   b,
    input   cin,
    output  cout,
    output  sum
);

    assign {cout, sum} = a + b + cin;

endmodule

module top_module (
    input   [2:0]   a,
    input   [2:0]   b,
    input           cin,
    output  [2:0]   cout,
    output  [2:0]   sum
);

    fadd fadd_i0 (
        .a      ( a[0]      ),
        .b      ( b[0]      ),
        .cin    ( cin       ),
        .cout   ( cout[0]   ),
        .sum    ( sum[0]    )
    );

    fadd fadd_i1 (
        .a      ( a[1]      ),
        .b      ( b[1]      ),
        .cin    ( cout[0]   ),
        .cout   ( cout[1]   ),
        .sum    ( sum[1]    )
    );

    fadd fadd_i2 (
        .a      ( a[2]      ),
        .b      ( b[2]      ),
        .cin    ( cout[1]   ),
        .cout   ( cout[2]   ),
        .sum    ( sum[2]    )
    );

endmodule