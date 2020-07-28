//
//
// https://hdlbits.01xz.net/wiki/Lemmings3
//
//

`default_nettype none

module top_module (
    input           clk,
    input           areset,
    input           bump_left,
    input           bump_right,
    input           ground,
    input           dig,
    output          walk_left,
    output          walk_right,
    output          aaah,
    output          digging
);

    parameter       LEFT        = 6'b000001,
                    LEFT_FALL   = 6'b000010,
                    LEFT_DIG    = 6'b000100,
                    RIGHT       = 6'b001000,
                    RIGHT_FALL  = 6'b010000,
                    RIGHT_DIG   = 6'b100000;

    reg     [5:0]   state;
    reg     [5:0]   next_state;

    always @(*) begin
        case (state)
        LEFT        : next_state = (~ground) ? LEFT_FALL :
                                               (dig) ? LEFT_DIG :
                                                       (bump_left) ? RIGHT : LEFT;
        LEFT_FALL   : next_state = (ground) ? LEFT : state;
        LEFT_DIG    : next_state = (~ground) ? LEFT_FALL : state;
        RIGHT       : next_state = (~ground) ? RIGHT_FALL :
                                               (dig) ? RIGHT_DIG :
                                                       (bump_right) ? LEFT : RIGHT;
        RIGHT_FALL  : next_state = (ground) ? RIGHT : state;
        RIGHT_DIG   : next_state = (~ground) ? RIGHT_FALL : state;

        default     : next_state = state;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if (areset)
            state <= LEFT;
        else
            state <= next_state;
    end

    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == LEFT_FALL) | (state == RIGHT_FALL);
    assign digging = (state == LEFT_DIG) | (state == RIGHT_DIG);

endmodule