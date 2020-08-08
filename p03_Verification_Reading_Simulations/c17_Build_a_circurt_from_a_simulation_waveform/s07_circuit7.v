//
//
// https://hdlbits.01xz.net/wiki/Sim/circuit7
//
//

`default_nettype none

module top_module (
    input   clk,
    input   a,
    output  q
);

    reg     r;

    always @(posedge clk) begin
        r <= ~a;
    end

    assign q = r;

endmodule
