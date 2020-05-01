//
//
// https://hdlbits.01xz.net/wiki/Exams/2014_q4b
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
    input   [3:0]   SW,
    input   [3:0]   KEY,
    output  [3:0]   LEDR
);

    wire    [3:0]   q_in;

    assign q_in = KEY[1] ? {KEY[3], LEDR[3:1]} : LEDR;

    mux_dff mux_dff_i0 (
        .clk    ( KEY[0]    ),
        .L      ( KEY[2]    ),
        .r_in   ( SW[0]     ),
        .q_in   ( q_in[0]   ),
        .Q      ( LEDR[0]   )
    );

    mux_dff mux_dff_i1 (
        .clk    ( KEY[0]    ),
        .L      ( KEY[2]    ),
        .r_in   ( SW[1]     ),
        .q_in   ( q_in[1]   ),
        .Q      ( LEDR[1]   )
    );

    mux_dff mux_dff_i2 (
        .clk    ( KEY[0]    ),
        .L      ( KEY[2]    ),
        .r_in   ( SW[2]     ),
        .q_in   ( q_in[2]   ),
        .Q      ( LEDR[2]   )
    );

    mux_dff mux_dff_i3 (
        .clk    ( KEY[0]    ),
        .L      ( KEY[2]    ),
        .r_in   ( SW[3]     ),
        .q_in   ( q_in[3]   ),
        .Q      ( LEDR[3]   )
    );

endmodule