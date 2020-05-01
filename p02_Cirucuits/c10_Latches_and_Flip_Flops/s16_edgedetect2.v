//
//
// https://hdlbits.01xz.net/wiki/Edgedetect2
//
//

`default_nettype none

module top_module (
    input           clk,
    input   [7:0]   in,
    output  [7:0]   anyedge
);

    reg     [7:0]   edge_r;
    always @(posedge clk ) begin
        edge_r <= in;
    end

    wire    [7:0]   toggle;
    assign toggle = edge_r ^ in;

    reg     [7:0]   q_r;
    always @(posedge clk) begin
        q_r <= toggle;
    end

    assign anyedge = q_r;

endmodule
