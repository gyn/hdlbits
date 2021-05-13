//
//
// https://hdlbits.01xz.net/wiki/Exams/review2015_fancytimer
//
//

`default_nettype none

module top_module (
    input           clk,
    input           reset,
    input           data,
    output  [3:0]   count,
    output          counting,
    output          done,
    input           ack
);


    localparam      CHECK_D1    = 4'd0,
                    CHECK_D2    = 4'd1,
                    CHECK_D3    = 4'd2,
                    CHECK_D4    = 4'd3,
                    SHIFT_B0  	= 4'd4,
                    SHIFT_B1  	= 4'd5,
                    SHIFT_B2  	= 4'd6,
                    SHIFT_B3  	= 4'd7,
                    COUNT_DOWN  = 4'd8,
                    WAIT_ACK    = 4'd9;

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
        CHECK_D4    : next_state = data ? SHIFT_B0 : CHECK_D1;
        SHIFT_B0    : next_state = SHIFT_B1;
        SHIFT_B1    : next_state = SHIFT_B2;
        SHIFT_B2    : next_state = SHIFT_B3;
        SHIFT_B3    : next_state = COUNT_DOWN;
        COUNT_DOWN  : next_state = counter_done ? WAIT_ACK : COUNT_DOWN;
        WAIT_ACK    : next_state = ack ? CHECK_D1 : WAIT_ACK;
        default     : next_state = CHECK_D1;
        endcase
    end

    //
    // Shift stage
    //
    reg     [3:0]   delay;
    reg     [3:0]   delay_next;

    always@(posedge clk) begin
        if (reset)
            delay <= '0;
        else
            delay <= delay_next;
    end

    always@(*) begin
        case (state)
        SHIFT_B0    ,
        SHIFT_B1    ,
        SHIFT_B2    ,
        SHIFT_B3    : delay_next = {delay[2:0], data};
        default     : delay_next = delay;
        endcase
    end

    //
    // Counter
    //
    wire            counter_load;

    assign counter_load = (state == SHIFT_B3);

    reg     [3:0]   counter;

    always@(posedge clk) begin
        if(reset)
            counter <= '0;
        else if (counter_load)
            counter <= delay_next;
        else if (timer_tick)
            if (counter == '0)
                counter <= '0;
            else
                counter <= counter - 1'b1;
    end

    //
    // mod-1000 timer
    //
    reg     [9:0]   timer;
    wire            timer_tick;
    wire            timer_en;

    assign timer_en = (state == COUNT_DOWN);

    always@(posedge clk) begin
        if(reset)
            timer <= '0;
        else if (timer_en)
            if (timer == 10'd1000 - 1'b1)
                timer <= '0;
            else
                timer <= timer + 1'b1;
        else
            timer <= '0;
    end

    assign timer_tick   = (timer == 10'd1000 - 1'b1);

    //
    // Output
    //
    wire            counter_done;

    assign counter_done = (~|counter) & timer_tick;

    assign done = (state == WAIT_ACK);
    assign count = counter;
    assign counting = (state == COUNT_DOWN);
endmodule
