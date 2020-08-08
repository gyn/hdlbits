//
//
// https://hdlbits.01xz.net/wiki/Tb/tff
//
//

`default_nettype none

`timescale 1ps/1ps

module top_module ( );

    localparam  CLK_PERIOD = 10;

    reg             clk;
    initial begin
        clk = 1'b0;

        forever
            #(CLK_PERIOD / 2) clk = ~clk;  
    end

    reg             reset;
    reg             t;
    wire            q;

    tff tff_u0 (
        .clk    ( clk   ),
        .reset  ( reset ),
        .t      ( t     ),
        .q      ( q     )
    );

    initial begin
        reset   = 1'b0;
        t       = 1'b0;

        @(negedge clk)
        reset   = 1'b1;

        @(negedge clk)
        reset   = 1'b0;
        t       = 1'b1;

        @(negedge clk)
        t       = 1'b0;

    end

endmodule