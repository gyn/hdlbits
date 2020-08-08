//
//
// https://hdlbits.01xz.net/wiki/Exams/review2015_fsmseq
//
//

`default_nettype none

module top_module (
    input       clk,
    input       reset,
    input       data,
    output      start_shifting
);

    parameter   CHECK_D1    = 3'd0,
                CHECK_D2    = 3'd1,
                CHECK_D3    = 3'd2,
                CHECK_D4    = 3'd3,
                CHECK_DONE  = 3'd4;

    reg [2:0]   state;
    reg [2:0]   next_state;

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
        CHECK_D4    : next_state = data ? CHECK_DONE : CHECK_D1;
        CHECK_DONE  : next_state = CHECK_DONE;
        default     : next_state = CHECK_D1;
        endcase
    end

    assign start_shifting = (state == CHECK_DONE);

endmodule
