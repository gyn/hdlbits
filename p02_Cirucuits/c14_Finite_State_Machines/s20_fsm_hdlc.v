//
//
// https://hdlbits.01xz.net/wiki/Fsm_hdlc
//
//

`default_nettype none

module top_module (
    input           clk,
    input           reset,
    input           in,
    output          disc,
    output          flag,
    output          err
);

    parameter       INIT        = 4'd0,
                    ONES_2      = 4'd1,
                    ONES_3      = 4'd2,
                    ONES_4      = 4'd3,
                    ONES_5      = 4'd4,
                    DISC        = 4'd5,
                    DISC_DONE   = 4'd6,
                    FLAG        = 4'd7,
                    FLAG_DONE   = 4'd8,
                    ERROR       = 4'd9;

    reg     [3:0]   state;
    reg     [3:0]   state_next;

    always @(posedge clk) begin
        if (reset) begin
            state <= INIT;
        end else begin
            state <= state_next;
        end
    end

    always @(*) begin
        case (state)
        INIT        ,
        ONES_2      ,
        ONES_3      ,
        ONES_4      ,
        ONES_5      : state_next = in ? (state + 1'b1) : INIT;
        DISC        : state_next = in ? FLAG : DISC_DONE;
        DISC_DONE   : state_next = in ? ONES_2 : INIT;
        FLAG        : state_next = in ? ERROR : FLAG_DONE;
        FLAG_DONE   : state_next = in ? ONES_2 : INIT;
        ERROR       : state_next = in ? ERROR : INIT;
        default     : state_next = INIT;
        endcase
    end

    assign disc = (state == DISC_DONE);
    assign flag = (state == FLAG_DONE);
    assign err  = (state == ERROR);

endmodule