//
//
// https://hdlbits.01xz.net/wiki/Exams/ece241_2013_q4
//
//

`default_nettype none

module top_module (
    input           clk,
    input           reset,
    input   [3:1]   s,
    output          fr3,
    output          fr2,
    output          fr1,
    output          dfr
);


    parameter       BELOW_S1    = 6'b000001,
                    S1_TO_S2    = 6'b000010,
                    S2_TO_S3    = 6'b000100,
                    ABOVE_S3    = 6'b001000,
                    S3_TO_S2    = 6'b010000,
                    S2_TO_S1    = 6'b100000;

    reg     [5:0]   state;
    reg     [5:0]   state_next;

    always @ (posedge clk) begin
        if(reset)
            state <= BELOW_S1;
        else
            state <= state_next;
    end

    always @ (*) begin
        case (state)
        BELOW_S1 : state_next = (s[3:1] == 3'b001) ? S1_TO_S2 : state;
        S1_TO_S2 : state_next = (s[3:1] == 3'b011) ? S2_TO_S3 : (s[3:1] == 3'b000) ? BELOW_S1 : state;
        S2_TO_S3 : state_next = (s[3:1] == 3'b111) ? ABOVE_S3 : (s[3:1] == 3'b001) ? S2_TO_S1 : state;
        ABOVE_S3 : state_next = (s[3:1] == 3'b011) ? S3_TO_S2 : state;
        S3_TO_S2 : state_next = (s[3:1] == 3'b001) ? S2_TO_S1 : (s[3:1] == 3'b111) ? ABOVE_S3 : state;
        S2_TO_S1 : state_next = (s[3:1] == 3'b000) ? BELOW_S1 : (s[3:1] == 3'b011) ? S2_TO_S3 : state;
        default  : state_next = state;
        endcase
    end

    assign fr3 = (state == BELOW_S1);
    assign fr2 = (state == BELOW_S1) | (state == S1_TO_S2) | (state == S2_TO_S1);
    assign fr1 = (state != ABOVE_S3);
    assign dfr = (state == BELOW_S1) | (state == S3_TO_S2) | (state == S2_TO_S1);

endmodule