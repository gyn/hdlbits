//
//
// https://hdlbits.01xz.net/wiki/Kmap1
//
//

`default_nettype none

module top_module (
    input   a,
    input   b,
    input   c,
    output  out
); 

    assign out = a | b | c;

endmodule