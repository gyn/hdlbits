//
//
// https://hdlbits.01xz.net/wiki/Mt2015_lfsr
//
//

`default_nettype none

//
// Usually one module in a file is recommended.
//
module mux_dff (
	input       clk,
	input       L,
	input       r_in,
	input       q_in,
	output reg  Q
);

    always @(posedge clk) begin
        if (L)
            Q <= r_in;
        else
            Q <= q_in;
    end

endmodule

module top_module (
	input   [2:0]   SW,     // R
	input   [1:0]   KEY,    // L and clk
	output  [2:0]   LEDR    // Q
);

    mux_dff mux_dff_i0 (
        .clk    ( KEY[0]    ),
        .L      ( KEY[1]    ),
        .r_in   ( SW[0]     ),
        .q_in   ( LEDR[2]   ),
        .Q      ( LEDR[0]   )
    );

    mux_dff mux_dff_i1 (
        .clk    ( KEY[0]    ),
        .L      ( KEY[1]    ),
        .r_in   ( SW[1]     ),
        .q_in   ( LEDR[0]   ),
        .Q      ( LEDR[1]   )
    );

    mux_dff mux_dff_i2 (
        .clk    ( KEY[0]            ),
        .L      ( KEY[1]            ),
        .r_in   ( SW[2]             ),
        .q_in   ( LEDR[1] ^ LEDR[2] ),
        .Q      ( LEDR[2]           )
    );

endmodule