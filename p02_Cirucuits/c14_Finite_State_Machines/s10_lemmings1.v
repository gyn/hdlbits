//
//
// https://hdlbits.01xz.net/wiki/Lemmings1
//
//

`default_nettype none

module top_module (
    input   clk,
    input   areset,
    input   bump_left,
    input   bump_right,
    output  walk_left,
    output  walk_right
);

    parameter   LEFT    = 1'b0,
                RIGHT   = 1'b1;

    reg     state;
    reg     next_state;

    always @(*) begin
        case (state)
        LEFT    : next_state = (bump_left) ? RIGHT : LEFT;
        RIGHT   : next_state = (bump_right) ? LEFT : RIGHT;
        default : next_state = state;
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

endmodule