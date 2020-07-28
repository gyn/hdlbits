//
//
// https://hdlbits.01xz.net/wiki/Fsm2
//
//

`default_nettype none

module top_module(
    input   clk,
    input   reset,      // Synchronous reset to OFF
    input   j,
    input   k,
    output  out
);

    parameter   ON  = 1'b1;
    parameter   OFF = 1'b0;

    reg         state;
    reg         next_state;

    always @(*) begin
        case (state)
        ON      : next_state = k ? OFF : ON;
        OFF     : next_state = j ? ON  : OFF;
        default : next_state = OFF;
        endcase
    end

    always @(posedge clk) begin
        if (reset)
            state <= OFF;
        else
            state <= next_state;
    end

    assign out = state;

endmodule