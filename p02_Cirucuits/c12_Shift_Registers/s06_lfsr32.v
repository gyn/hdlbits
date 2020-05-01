//
//
// https://hdlbits.01xz.net/wiki/Lfsr32
//
//

`default_nettype none

module top_module (
    input           clk,
    input           reset,      // Active-high synchronous reset to 32'h1
    output  [31:0]  q
); 

    reg     [31:0]  q_reg;
    wire    [31:0]  q_next;
    always @(posedge clk) begin
        if (reset)
            q_reg <= 32'h1;
        else
            q_reg <= q_next;
    end

    assign q_next = {
                      1'b0      ^ q_reg[0],     // 31
                      q_reg[31:23],             // 30 : 22
                      q_reg[22] ^ q_reg[0],     // 21
                      q_reg[21:3],              // 20 : 2
                      q_reg[2]  ^ q_reg[0],     // 1
                      q_reg[1]  ^ q_reg[0]      // 0
                    };

    assign q = q_reg;

endmodule