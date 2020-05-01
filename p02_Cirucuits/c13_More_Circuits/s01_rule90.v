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

    assign q_next[0] = q_reg[1] ^ 1'b0;

    generate
    genvar i;
        for (i = 1; i < 511; i = i + 1) begin : loop
            assign q_next[i] = q_reg[i+1] ^ q_reg[i-1];
        end
    endgenerate

    assign q_next[511] = 1'b0 ^ q_reg[510];

    assign q = q_reg;

endmodule