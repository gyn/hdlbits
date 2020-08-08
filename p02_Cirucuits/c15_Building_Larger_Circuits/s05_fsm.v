//
//
// https://hdlbits.01xz.net/wiki/Exams/review2015_fsm
//
//

`default_nettype none

module top_module (
    input           clk,
    input           reset,      // Synchronous reset
    input           data,
    output          shift_ena,
    output          counting,
    input           done_counting,
    output          done,
    input           ack
);

    parameter       CHECK_D1    = 4'd0,
                    CHECK_D2    = 4'd1,
                    CHECK_D3    = 4'd2,
                    CHECK_D4    = 4'd3,
                    STATUS_B0  	= 4'd4,
                    STATUS_B1  	= 4'd5,
                    STATUS_B2  	= 4'd6,
                    STATUS_B3  	= 4'd7,
                    COUNT_START = 4'd8,
                    COUNT_WAIT	= 4'd9;

    reg     [3:0]   state;
    reg     [3:0]   next_state;

    always@(posedge clk) begin
        if(reset)
            state <= CHECK_D1;
        else
            state <= next_state;
    end

    always@(*) begin
        case(state)
        CHECK_D1    : next_state = data ? CHECK_D2 : CHECK_D1;
        CHECK_D2    : next_state = data ? CHECK_D3 : CHECK_D1;
        CHECK_D3    : next_state = data ? CHECK_D3 : CHECK_D4;
        CHECK_D4    : next_state = data ? STATUS_B0 : CHECK_D1;
        STATUS_B0   : next_state = STATUS_B1;
        STATUS_B1   : next_state = STATUS_B2;
        STATUS_B2   : next_state = STATUS_B3;
        STATUS_B3   : next_state = COUNT_START;
        COUNT_START : next_state = done_counting ? COUNT_WAIT : COUNT_START;
        COUNT_WAIT  : next_state = ack ? CHECK_D1 : COUNT_WAIT;
        default     : next_state = CHECK_D1;
        endcase
    end

    assign shift_ena = (state == STATUS_B0) | (state == STATUS_B1) | (state == STATUS_B2) | (state == STATUS_B3);
    assign counting  = (state == COUNT_START);
    assign done      = (state == COUNT_WAIT);

endmodule
