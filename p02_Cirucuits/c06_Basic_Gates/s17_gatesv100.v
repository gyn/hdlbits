//
//
// https://hdlbits.01xz.net/wiki/Gatesv100
//
//

`default_nettype none

module top_module (
    input   [99:0]  in,
    output  [98:0]  out_both,
    output  [99:1]  out_any,
    output  [99:0]  out_different
);

    localparam      BASE    = 0,
                    LIMIT   = 99;

    assign out_both = in[LIMIT - 1 + 1:BASE + 1] & in[LIMIT - 1:BASE];

    assign out_any  = in[LIMIT - 1 + 1:BASE + 1] | in[LIMIT - 1:BASE];

    assign out_different = {in[0] ^ in[99], in[LIMIT - 1 + 1:BASE + 1] ^ in[LIMIT - 1:BASE]};

endmodule