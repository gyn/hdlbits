//
//
// https://hdlbits.01xz.net/wiki/Rule110
//
//

`default_nettype none


module top_module (
    input           clk,
    input           load,
    input   [511:0] data,
    output  [511:0] q
);

    reg     [511:0] q_reg;
    wire    [511:0] q_next;
    always @(posedge clk) begin
        if (load)
            q_reg <= data;
        else
            q_reg <= q_next;
    end

    //
    // C' = (~R & C) | (R & ~C) | (~L & C)
    //
    // Specially, C0' = C and C511' = C | R
    //
    localparam      BASE    = 1,
                    LIMIT   = 511;

    assign q_next = {q_reg[511] | q_reg[510],
                     ((~q_reg[LIMIT - 1 - 1:BASE - 1] &  q_reg[LIMIT - 1:BASE]) |
                      ( q_reg[LIMIT - 1 - 1:BASE - 1] & ~q_reg[LIMIT - 1:BASE]) |
                      (~q_reg[LIMIT - 1 + 1:BASE + 1] &  q_reg[LIMIT - 1:BASE])),
                     q_reg[0]};

    assign q = q_reg;

endmodule