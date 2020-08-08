//
//
// https://hdlbits.01xz.net/wiki/Tb/tb2
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

    reg             in;
    reg     [2:0]   s;
    wire            out;

    q7 q7_u0 (
        .clk    ( clk   ),
        .in     ( in    ),
        .s      ( s     ),
        .out    ( out   )
    );

    initial begin
        in  = 1'b0;
        s   = 3'd2;

        @(negedge clk)
        s   = 3'd6;

        @(negedge clk)
        in  = 1'b1;
        s   = 3'd2;

        @(negedge clk)
        in  = 1'b0;
        s   = 3'd7;

        @(negedge clk)
        in  = 1'b1;
        s   = 3'd0;

        repeat (2) @(negedge clk) /* hold for 2 cycles */;

        @(negedge clk)
        in  = 1'b0;

    end

endmodule