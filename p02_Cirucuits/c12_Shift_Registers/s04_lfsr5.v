//
//
// https://hdlbits.01xz.net/wiki/Lfsr5
//
//

`default_nettype none

module top_module (
    input           clk,
    input           reset,
    output  [4:0]   q
);

    reg     [4:0]   q_reg;
    wire    [4:0]   q_next;
    always @(posedge clk) begin
        if (reset)
            q_reg <= 5'h1;
        else
            q_reg <= q_next;
    end

    assign q_next = {1'b0 ^ q_reg[0], q_reg[4], q_reg[3] ^ q_reg[0],  q_reg[2], q_reg[1]};

    assign q = q_reg;

endmodule