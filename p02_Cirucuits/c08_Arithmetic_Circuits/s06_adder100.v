//
//
// https://hdlbits.01xz.net/wiki/Adder100
//
//

`default_nettype none

module top_module (
    input   [99:0]  a,
    input   [99:0]  b,
    input           cin,
    output          cout,
    output  [99:0]  sum
);

    assign {cout, sum} = a + b + {99'b0, cin};

endmodule