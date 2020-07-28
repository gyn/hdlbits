//
//
// https://hdlbits.01xz.net/wiki/Fsm3comb
//
//

`default_nettype none

module top_module(
    input           in,
    input   [1:0]   state,
    output  [1:0]   next_state,
    output          out
);

    parameter   A = 2'd0,
                B = 2'd1,
                C = 2'd2,
                D = 2'd3;

    // State transition logic: Derive an equation for each state flip-flop.
    reg    [1:0]   state_next;
    always @(*) begin
        case (state)
        A   : state_next = in ? B : A;
        B   : state_next = in ? B : C;
        C   : state_next = in ? D : A;
        D   : state_next = in ? B : C;
        endcase
    end

    // Output logic: 
    assign next_state = state_next;

    assign out = (state == D);

endmodule
