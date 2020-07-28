//
//
// https://hdlbits.01xz.net/wiki/Exams/2014_q3bfsm
//
//

`default_nettype none

module top_module (
    input           clk,
    input           reset,
    input           x,
    output          z
);

    parameter       S0  = 3'b000,
                    S1  = 3'b001,
                    S2  = 3'b010,
                    S3  = 3'b011,
                    S4  = 3'b100;

    reg     [2:0]   state;
    reg     [2:0]   state_next;

    always @(posedge clk) begin
        if (reset)
            state <= S0;
        else
            state <= state_next;
    end

    always @(*) begin
        case (state)
        S0          : state_next = x ? S1 : S0;
        S1          : state_next = x ? S4 : S1;
        S2          : state_next = x ? S1 : S2;
        S3          : state_next = x ? S2 : S1;
        S4          : state_next = x ? S4 : S3; 
        default     : state_next = S0;
        endcase
    end

    assign z = (state == S3) | (state == S4);

endmodule