//
//
// https://hdlbits.01xz.net/wiki/Reduction
//
//

`default_nettype none

module top_module (
    input   [7:0]   in,
    output          parity
); 

    assign parity = ^in;

endmodule