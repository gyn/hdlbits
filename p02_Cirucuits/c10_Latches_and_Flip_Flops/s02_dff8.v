//
//
// https://hdlbits.01xz.net/wiki/Dff8
//
//

`default_nettype none

module top_module (
    input           clk,
    input   [7:0]   d,
    output  [7:0]   q
);

    reg [7:0]   q_r;
    always @(posedge clk ) begin
        q_r <= d;
    end

    assign q = q_r;

endmodule