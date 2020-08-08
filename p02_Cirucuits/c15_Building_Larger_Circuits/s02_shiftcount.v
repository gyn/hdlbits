//
//
// https://hdlbits.01xz.net/wiki/Exams/review2015_shiftcount
//
//

`default_nettype none

module top_module (
    input           clk,
    input           shift_ena,
    input           count_ena,
    input           data,
    output  [3:0]   q
);

    reg     [3:0]   counter;

    always @(posedge clk) begin
        if (shift_ena)
            counter <= {counter[2:0], data};
        else if (count_ena)
            counter <= counter - 1'b1;
    end

    assign q = counter;

endmodule
