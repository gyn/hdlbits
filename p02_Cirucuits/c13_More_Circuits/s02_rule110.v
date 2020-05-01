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
    assign q_next[0] = q_reg[0];

    generate
    genvar i;
        for (i = 1; i < 511; i = i + 1) begin : loop
            assign q_next[i] = (~q_reg[i-1] &  q_reg[i]) |
                               ( q_reg[i-1] & ~q_reg[i]) |
                               (~q_reg[i+1] &  q_reg[i]);
        end
    endgenerate

    assign q_next[511] = q_reg[511] | q_reg[510];

    assign q = q_reg;

endmodule