//
//
// https://hdlbits.01xz.net/wiki/Exams/ece241_2013_q8
//
//

`default_nettype none

module top_module (
    input           clk,
    input           aresetn,
    input           x,
    output          z
);

    parameter       INIT    = 2'd0,
                    SEQ_1   = 2'd1,
                    SEQ_10  = 2'd2;

    reg     [1:0]   state;
    reg     [1:0]   state_next;

    always @(posedge clk, negedge aresetn) begin
        if (~aresetn) begin
            state <= INIT;
        end else begin
            state <= state_next;
        end
    end

    always @(*) begin
        case (state)
        INIT        : state_next = x ? SEQ_1 : INIT;
        SEQ_1       : state_next = x ? SEQ_1 : SEQ_10;
        SEQ_10      : state_next = x ? SEQ_1 : INIT;
        default     : state_next = INIT;
        endcase
    end

    assign z = (state == SEQ_10) & x;

endmodule