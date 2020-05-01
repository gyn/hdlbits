//
//
// https://hdlbits.01xz.net/wiki/Vector1
//
//

`default_nettype none

module top_module (
    input  wire [15:0]  in,
    output wire [7:0]   out_hi,
    output wire [7:0]   out_lo
);

    assign out_hi = in[15:8];
    assign out_lo = in[7:0];

endmodule