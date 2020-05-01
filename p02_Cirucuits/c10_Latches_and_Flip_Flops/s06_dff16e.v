//
//
// https://hdlbits.01xz.net/wiki/Dff16e
//
//

`default_nettype none

module top_module (
    input           clk,
    input           resetn,
    input   [1:0]   byteena,
    input   [15:0]  d,
    output  [15:0]  q
);

    reg     [15:0]  q_r;
    wire    [15:0]  q_next;
    always @(posedge clk) begin
        if (!resetn)
            q_r <= '0;
        else
            q_r <= q_next;
    end

    assign q_next = {byteena[1] ? d[15:8] : q_r[15:8], byteena[0] ? d[7:0] : q_r[7:0]};

    assign q = q_r;

endmodule