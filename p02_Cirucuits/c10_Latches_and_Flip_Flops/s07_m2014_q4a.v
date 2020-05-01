//
//
// https://hdlbits.01xz.net/wiki/Exams/m2014_q4a
//
//

`default_nettype none

module top_module (
    input           d, 
    input           ena,
    output  reg     q
);

    always @(*) begin
        //
        // This latch is intended
        //
        if (ena)
            q = d;
    end

endmodule