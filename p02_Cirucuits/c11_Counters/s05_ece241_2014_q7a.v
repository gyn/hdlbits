//
//
// https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q7a
//
//

`default_nettype none

module top_module (
    input           clk,
    input           reset,
    input           enable,
    output  [3:0]   Q,
    output          c_enable,
    output          c_load,
    output  [3:0]   c_d
);

    wire    [3:0]   counter_next;
    wire            counter_load;
    wire            counter_enable;

    always @(*) begin
        counter_load   = 1'b0;
        counter_enable = enable;

        if (reset) begin
            counter_load = 1'b1;

            counter_next = 4'd1;
        end
        else
            if (enable)
                if (Q == 4'hd - 1'b1) begin
                    counter_load = 1'b1;

                    counter_next = 4'd1;
                end
                else
                    counter_next = Q + 1'b1;
            else
                counter_next = Q;
    end

    count4 the_counter (
        .clk    ( clk               ),
        .enable ( counter_enable    ),
        .load   ( counter_load      ),
        .d      ( counter_next      ),
        .Q      ( Q                 )
    );

    assign c_enable = counter_enable;
    assign c_load   = counter_load;
    //
    // I expected the following code would work before I failed to pass the tests
    //
    // assign c_d      = counter_next;
    //
    //
    assign c_d      = counter_load ? 4'b1 : '0;

endmodule