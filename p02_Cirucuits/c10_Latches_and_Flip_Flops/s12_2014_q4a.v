//
//
// https://hdlbits.01xz.net/wiki/Exams/2014_q4a
//
//

`default_nettype none

module top_module (
    input   clk,
    input   w,
    input   R,
    input   E,
    input   L,
    output  Q
);

    reg     q_r;
    always @(posedge clk) begin
        if (L)
            q_r <= R;
        else
            if (E)
                q_r <= w;
            else
                q_r <= q_r;
    end

    assign Q = q_r;

endmodule