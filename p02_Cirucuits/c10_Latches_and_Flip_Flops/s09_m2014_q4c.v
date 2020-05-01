//
//
// https://hdlbits.01xz.net/wiki/Exams/m2014_q4c
//
//

`default_nettype none


module top_module (
    input   clk,
    input   d, 
    input   r,
    output  q
);

    reg     q_r;
    always @(posedge clk) begin
        if (r)
            q_r <= '0;
        else
            q_r <= d;
    end

    assign q = q_r;

endmodule