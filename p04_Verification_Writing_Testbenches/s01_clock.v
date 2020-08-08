//
//
// https://hdlbits.01xz.net/wiki/Tb/clock
//
//

`default_nettype none

`timescale 1ps/1ps

module top_module ( );

    localparam	CLK_PERIOD = 10;

    reg     clk;
    initial begin
        clk = 1'b0;

        forever
            #(CLK_PERIOD / 2) clk = ~clk;  
    end


    dut dut_u0 (
        .clk    ( clk )
    );

endmodule