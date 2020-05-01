//
//
// https://hdlbits.01xz.net/wiki/Always_nolatches
//
//

`default_nettype none

module top_module (
    input   [7:0] a,
    input   [7:0] b,
    input   [7:0] c,
    input   [7:0] d,
    output  [7:0] min
);

    wire    [7:0]   minab;
    wire    [7:0]   mincd;

    assign minab = (a < b) ? a : b;
    assign mincd = (c < d) ? c : d;

    assign min  = (minab < mincd) ? minab : mincd;

endmodule