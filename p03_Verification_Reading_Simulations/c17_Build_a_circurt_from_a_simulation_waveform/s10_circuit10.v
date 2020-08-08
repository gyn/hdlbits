//
//
// https://hdlbits.01xz.net/wiki/Sim/circuit10
//
//

`default_nettype none

module top_module (
    input   clk,
    input   a,
    input   b,
    output  q,
    output  state
);

    //
    // For state
    //
    //      ab
    //
    //  d   d'  00  01  11  10
    //
    //       0   0   0   1   0
    //
    //       1   0   1   1   1
    //
    //
    // d' = (a & b) | (d & a ) | (d & b)
    //
    // For q
    //
    //      ab
    //
    //  d    q  00  01  11  10
    //
    //       0   0   1   0   1
    //
    //       1   1   0   1   0
    //
    //
    // q = d ^~ (a ^~ b) 
    //

    reg     r_d;
    wire    r_d_next;

    always @(posedge clk) begin
        r_d <= r_d_next;
    end

    assign r_d_next = (a   & b) |
                      (r_d & a) |
                      (r_d & b);

    assign q        = r_d ^~ (a ^~b);
    assign state    = r_d;

endmodule