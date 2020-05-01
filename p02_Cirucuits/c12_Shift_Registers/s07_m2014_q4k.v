//
//
// https://hdlbits.01xz.net/wiki/Exams/m2014_q4k
//
//

`default_nettype none

module top_module (
    input   clk,
    input   resetn,     // synchronous reset
    input   in,
    output  out
);

    reg     [3:0]   q_reg;
    always @(posedge clk) begin
        if (!resetn)
            q_reg <= '0;
        else
            q_reg <= {q_reg[2:0], in};
    end

    assign out = q_reg[3];

endmodule
