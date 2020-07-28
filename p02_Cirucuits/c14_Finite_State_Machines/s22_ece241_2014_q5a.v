//
//
// https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q5a
//
//

`default_nettype none

module top_module (
    input           clk,
    input           areset,
    input           x,
    output          z
);

    parameter       S0  = 2'd0,
                    S1  = 2'd1,
                    S2  = 2'd2;

    reg     [1:0]   state;
    reg     [1:0]   state_next;

    always @(posedge clk, posedge areset) begin
        if (areset)
            state <= S0;
        else
            state <= state_next;
    end

    always @(*) begin
        case (state)
        S0          : state_next = x ? S1 : S0;
        S1          : state_next = x ? S2 : S1;
        S2          : state_next = x ? S2 : S1;
        default     : state_next = S0;
        endcase
    end

    assign z = (state == S1);

endmodule