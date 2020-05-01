//
//
// https://hdlbits.01xz.net/wiki/Exams/m2014_q4b
//
//

`default_nettype none

module top_module (
    input   clk,
    input   d, 
    input   ar,
    output  q
);

    reg     q_r;
    always @(posedge clk, posedge ar) begin
        if (ar)
            q_r <= '0;
        else
            q_r <= d;
    end

    assign q = q_r;

endmodule