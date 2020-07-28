//
//
// https://hdlbits.01xz.net/wiki/Lemmings2
//
//

`default_nettype none

module top_module (
    input           clk,
    input           areset,
    input           bump_left,
    input           bump_right,
    input           ground,
    output          walk_left,
    output          walk_right,
    output          aaah
);

    parameter       LEFT        = 4'b0001,
                    LEFT_FALL   = 4'b0010,
                    RIGHT       = 4'b0100,
                    RIGHT_FALL  = 4'b1000;

    reg     [3:0]   state;
    reg     [3:0]   next_state;

    always @(*) begin
        case (state)
        LEFT        : next_state = (~ground) ? LEFT_FALL :
                                               (bump_left) ? RIGHT : LEFT;
        LEFT_FALL   : next_state = (ground) ? LEFT : state;
        RIGHT       : next_state = (~ground) ? RIGHT_FALL :
                                               (bump_right) ? LEFT : RIGHT;
        RIGHT_FALL  : next_state = (ground) ? RIGHT : state;
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

endmodule