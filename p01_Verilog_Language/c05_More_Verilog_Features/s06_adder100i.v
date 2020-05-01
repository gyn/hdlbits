//
//
// https://hdlbits.01xz.net/wiki/Adder100i
//
//

`default_nettype none

module top_module (
    input   [99:0]  a,
    input   [99:0]  b,
    input           cin,
    output  [99:0]  cout,
    output  [99:0]  sum
);

    wire    [100:0] cout_in;

    assign cout_in[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : loop
            assign {cout[i], sum[i]} = a[i] + b[i] + cout_in[i];

            assign cout_in[i+1] = cout[i];
        end
    endgenerate

    wire unused_cout;
    assign unused_cout = cout_in[100];
endmodule