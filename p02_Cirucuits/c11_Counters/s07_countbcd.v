//
//
// https://hdlbits.01xz.net/wiki/Countbcd
//
//

`default_nettype none

//
// Usually one module in a file is recommended.
//
module bcd_counter (
    input           clk,
    input           reset,
    input           enable,
    output          tick,
    output  [3:0]   bcd
);
    reg     [3:0]   counter;

    always @(posedge clk) begin
        if (reset)
            counter <= '0;
        else
            if (enable)
                if (counter == 4'd10 - 1'b1)
                    counter <= '0;
                else
                    counter <= counter + 1'b1;
            // Usually the last no-change else branch could be omitted
            else
                counter <= counter;
    end

    assign bcd  = counter;
    assign tick = enable && (counter == 4'd10 - 1'b1);

endmodule

module top_module (
    input           clk,
    input           reset,
    output  [3:1]   ena,
    output  [15:0]  q
);

    reg     [4:0]   enable;

    assign enable[0] = 1'b1;

    generate
        genvar i;
        for (i = 0; i < 4; i = i + 1) begin : loop
            bcd_counter bcd_counter_i (
                .clk    ( clk                   ),
                .reset  ( reset                 ),
                .enable ( enable[i]             ),
                .tick   ( enable[i+1]           ),
                .bcd    ( q[4 * i + 3 : 4 * i]  )
            );
        end
    endgenerate

    assign ena = enable[3:1];

    /* verilator lint_off UNUSED */
    wire    [0:0]   unused;
    assign unused = {enable[4]};
    /* verilator lint_on UNUSED */

endmodule