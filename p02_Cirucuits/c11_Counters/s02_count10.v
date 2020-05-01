//
//
// https://hdlbits.01xz.net/wiki/Count10
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
            if (counter == 4'd10 - 1'b1)
                counter <= '0;
            else
                counter <= counter + 1'b1;
    end

    assign q = counter;

endmodule