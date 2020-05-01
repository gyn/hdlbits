//
//
// https://hdlbits.01xz.net/wiki/Exams/m2014_q4d
//
//

`default_nettype none

module top_module (
    input   clk,
    input   in,
    output  out
);

    reg     out_r;
    wire    out_next;
    always @(posedge clk ) begin
        out_r <= out_next;
    end

    assign out_next = in ^ out_r;

    assign out = out_r;

endmodule