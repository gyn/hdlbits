//
//
// https://hdlbits.01xz.net/wiki/vector100r
//
//

`default_nettype none

module top_module (
    input   [99:0]  in,
    output  [99:0]  out
);

    generate
    genvar i;
        for (i = 0; i < 100; i = i + 1) begin : loop
            assign out[i] = in[99-i];
        end
    endgenerate

endmodule