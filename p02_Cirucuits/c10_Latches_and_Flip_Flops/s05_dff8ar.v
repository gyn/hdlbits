//
//
// https://hdlbits.01xz.net/wiki/Dff8ar
//
//

`default_nettype none

module top_module (
    input           clk,
    input           areset,
    input   [7:0]   d,
    output  [7:0]   q
);

    reg [7:0]   q_r;
    always @(posedge clk, posedge areset) begin
        if (areset)
            q_r <= '0;
        else
            q_r <= d;
    end

    assign q = q_r;

endmodule