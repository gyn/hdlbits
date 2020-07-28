//
//
// https://hdlbits.01xz.net/wiki/Lemmings4
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

    parameter       LEFT        = 7'b0000001,
                    LEFT_FALL   = 7'b0000010,
                    LEFT_DIG    = 7'b0000100,
                    RIGHT       = 7'b0001000,
                    RIGHT_FALL  = 7'b0010000,
                    RIGHT_DIG   = 7'b0100000,
                    SPLATTER    = 7'b1000000;

    reg     [4:0]   counter;
    reg             counter_en;

    always @(posedge clk, posedge areset) begin
        if (areset)
            counter <= '0;
        else if (counter_en)
            if (counter == 5'd20 - 1'b1)
                counter <= '0;
            else
                counter <= counter + 1'b1;
        else
            counter <= '0;
    end

    reg             fall_too_long;

    always @(posedge clk, posedge areset) begin
        if (areset)
            fall_too_long <= '0;
        else if (counter_en)
            if (counter == 5'd20 - 1'b1)
                fall_too_long <= 1'b1;
    end

    reg     [6:0]   state;
    reg     [6:0]   next_state;

    always @(*) begin
        counter_en = (state == LEFT_FALL) | (state == RIGHT_FALL);

        case (state)
        LEFT        : next_state = (~ground) ? LEFT_FALL :
                                               (dig) ? LEFT_DIG :
                                                       (bump_left) ? RIGHT : LEFT;
        LEFT_FALL   : next_state = (~ground) ? state :
                                            (fall_too_long) ? SPLATTER : LEFT;
        LEFT_DIG    : next_state = (~ground) ? LEFT_FALL : state;
        RIGHT       : next_state = (~ground) ? RIGHT_FALL :
                                               (dig) ? RIGHT_DIG :
                                                       (bump_right) ? LEFT : RIGHT;
        RIGHT_FALL  : next_state = (~ground) ? state :
                                            (fall_too_long) ? SPLATTER : RIGHT;
        RIGHT_DIG   : next_state = (~ground) ? RIGHT_FALL : state;

        SPLATTER    : next_state = state;
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