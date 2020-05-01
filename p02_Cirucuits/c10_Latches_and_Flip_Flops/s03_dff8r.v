//
//
// https://hdlbits.01xz.net/wiki/Dff8r
//
//

`default_nettype none

module top_module (
    input           clk,
    input           reset,
    input   [7:0]   d,
    output  [7:0]   q
);

    reg [7:0]   q_r;
    always @(posedge clk) begin
        if (reset)
            q_r <= '0;
        else
            q_r <= d;
    end

    assign q = q_r;

endmodule