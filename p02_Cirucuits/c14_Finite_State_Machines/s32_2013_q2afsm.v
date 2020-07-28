//
//
// https://hdlbits.01xz.net/wiki/Exams/2013_q2afsm
//
//

`default_nettype none

module top_module (
    input           clk,
    input           resetn,
    input   [3:1]   r,
    output  [3:1]   g
);

    parameter       STATE_A     = 4'b0001,
                    STATE_B     = 4'b0010,
                    STATE_C     = 4'b0100,
                    STATE_D     = 4'b1000;

    reg     [3:0]   state;
    reg     [3:0]   state_next;

    always @(posedge clk) begin
        if (~resetn) begin
            state <= STATE_A;
        end else begin
            state <= state_next;
        end
    end

    always @(*) begin
        case (state)
        STATE_A     : state_next = r[1] ? STATE_B :
                                          r[2] ? STATE_C :
                                                 r[3] ? STATE_D : STATE_A;
        STATE_B     : state_next = r[1] ? STATE_B : STATE_A;
        STATE_C     : state_next = r[2] ? STATE_C : STATE_A;
        STATE_D     : state_next = r[3] ? STATE_D : STATE_A;
        default     : state_next = STATE_A;
        endcase
    end

    assign g = {state == STATE_D, state == STATE_C, state == STATE_B};

endmodule