//
//
// https://hdlbits.01xz.net/wiki/Count15
//
//

`default_nettype none

module top_module (
    input           clk,
    input           reset,
    output  [3:0]   q
);

    reg     [3:0]   counter;
    always @(posedge clk) begin
        if (reset)
            counter <= '0;
        else
            counter <= counter + 1'b1;
    end

    assign q = counter;

endmodule