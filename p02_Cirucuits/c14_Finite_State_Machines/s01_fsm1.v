//
//
// https://hdlbits.01xz.net/wiki/Fsm1
//
//

`default_nettype none

module top_module (
    input   clk,
    input   areset,     // Asynchronous reset to state B
    input   in,
    output  out
);

    parameter   A = 1'b0;
    parameter   B = 1'b1;

    reg         state;
    reg         next_state;

    always @(*) begin
        case (state)
        A       : next_state = in ? A : B;
        B       : next_state = in ? B : A;
        default : next_state = B;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if (areset)
            state <= B;
        else
            state <= next_state;
    end

    // Output logic
    assign out = state;

endmodule