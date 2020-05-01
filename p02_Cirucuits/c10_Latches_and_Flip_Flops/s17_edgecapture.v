//
//
// https://hdlbits.01xz.net/wiki/Edgecapture
//
//

`default_nettype none

module top_module (
    input           clk,
    input           reset,
    input   [31:0]  in,
    output  [31:0]  out
);

    reg     [31:0]  edge_r;
    always @(posedge clk) begin
        edge_r <= in;
    end

    wire    [31:0]  falling;
    assign falling = edge_r & ~in;

    reg     [31:0]  q_r;
    always @(posedge clk) begin
        if (reset)
            q_r <= '0;
        else
            q_r <= falling | q_r;
    end

    assign out = q_r;

endmodule