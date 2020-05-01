//
//
// https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q4
//
//

`default_nettype none

module top_module (
    input   clk,
    input   x,
    output  z
);

    reg [2:0]   q_r;
    always @(posedge clk) begin
        q_r <= {~q_r[2] | x, ~q_r[1] & x, q_r[0] ^ x};
    end

    assign z = ~|q_r;

endmodule