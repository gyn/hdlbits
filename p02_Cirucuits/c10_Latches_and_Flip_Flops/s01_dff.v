//
//
// https://hdlbits.01xz.net/wiki/Dff
//
//

`default_nettype none

module top_module (
    input       clk,
    input       d,
    output reg  q
);

    always @(posedge clk) begin
        q <= d;
    end

endmodule