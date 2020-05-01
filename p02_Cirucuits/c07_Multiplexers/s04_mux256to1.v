//
//
// https://hdlbits.01xz.net/wiki/Mux256to1
//
//

`default_nettype none

module top_module (
    input   [255:0] in,
    input   [7:0]   sel,
    output          out
);

    assign out = in[sel];

endmodule