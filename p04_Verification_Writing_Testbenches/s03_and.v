//
//
// https://hdlbits.01xz.net/wiki/Tb/and
//
//

`default_nettype none

`timescale 1ps/1ps

module top_module ( );

    reg     [1:0]   in;
    wire            out;

    andgate andgate_u0 (
        .in     ( in    ),
        .out    ( out   )
    );

    initial begin
        in = 2'b00;

        repeat (3) #10 in = in + 1'b1;
    end

endmodule