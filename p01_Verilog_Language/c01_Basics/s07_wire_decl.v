//
//
// https://hdlbits.01xz.net/wiki/Wire_decl
//
//

`default_nettype none

module top_module (
    input   a,
    input   b,
    input   c,
    input   d,
    output  out,
    output  out_n
);

    wire m;
    assign m = a & b;

    wire n;
    assign n = c & d;

    assign out = m | n;

    assign out_n = ~out;

endmodule