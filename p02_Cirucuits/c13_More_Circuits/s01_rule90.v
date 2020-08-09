//
//
// https://hdlbits.01xz.net/wiki/Rule90
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

    localparam      BASE    = 1,
                    LIMIT   = 511;

    assign q_next = {1'b0 ^ q_reg[510], q_reg[LIMIT - 1 + 1:BASE + 1] ^ q_reg[LIMIT - 1 - 1:BASE - 1], q_reg[1] ^ 1'b0};

    assign q = q_reg;

endmodule