//
//
// https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q5b
//
//

`default_nettype none

module top_module (
    input           clk,
    input           areset,
    input           x,
    output          z
);

    parameter       SA  = 2'b01,
                    SB  = 2'b10;

    reg     [1:0]   state;
    reg     [1:0]   state_next;

    always @(posedge clk, posedge areset) begin
        if (areset)
            state <= SA;
        else
            state <= state_next;
    end

    always @(*) begin
        case (state)
        SA          : state_next = x ? SB : SA;
        SB          : state_next = SB;
        default     : state_next = SA;
        endcase
    end

    assign z = ((state == SA) & x ) | ((state == SB) & ~x);

endmodule