//
//
// https://hdlbits.01xz.net/wiki/Exams/2013_q2bfsm
//
//

`default_nettype none

module top_module (
    input       clk,
    input       resetn,
    input       x,
    input       y,
    output      f,
    output      g
);

    parameter   STATE_A     = 4'd0,
                OUTPUT_F1   = 4'd1,
                CHECK_X0    = 4'd2,
                CHECK_X1    = 4'd3,
                CHECK_X2    = 4'd4,
                OUTPUT_G1   = 4'd5,
                DONE_G1     = 4'd6,
                CHECK_Y     = 4'd7,
                DONE_G0     = 4'd8;

    reg [3:0]   state;
    reg [3:0]   next_state;

    always@(posedge clk) begin
        if(~resetn)
            state <= STATE_A;
        else
            state <= next_state;
    end

    always@(*) begin
        case(state)
        STATE_A     : next_state = resetn ? OUTPUT_F1 : STATE_A;
        OUTPUT_F1   : next_state = CHECK_X0;
        CHECK_X0    : next_state = x ? CHECK_X1 : CHECK_X0;
        CHECK_X1    : next_state = x ? CHECK_X1 : CHECK_X2;
        CHECK_X2    : next_state = x ? OUTPUT_G1 : CHECK_X0;
        OUTPUT_G1   : next_state = y ? DONE_G1 : CHECK_Y;
        CHECK_Y     : next_state = y ? DONE_G1 : DONE_G0;
        DONE_G1     : next_state = resetn ? DONE_G1 : STATE_A;
        DONE_G0     : next_state = resetn ? DONE_G0 : STATE_A;
        default     : next_state = STATE_A;
        endcase
    end

    assign f = (state == OUTPUT_F1);
    assign g = (state == OUTPUT_G1) | (state == CHECK_Y) | (state == DONE_G1);

endmodule
