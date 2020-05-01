//
//
// https://hdlbits.01xz.net/wiki/popcount255
//
//

`default_nettype none

module top_module (
    input   [254:0] in,
    output  [7:0]   out
);

    integer         i;
    reg     [7:0]   result;

    always @(*) begin
        result = '0;

        for (i = 0; i < 255; i = i + 1)
            result = result + {7'b0, in[i]};
    end

    assign out = result;

endmodule
