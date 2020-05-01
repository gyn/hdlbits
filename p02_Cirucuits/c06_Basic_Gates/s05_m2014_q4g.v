//
//
// https://hdlbits.01xz.net/wiki/Exams/m2014_q4g
//
//

`default_nettype none

module top_module (
    input   in1,
    input   in2,
    input   in3,
    output  out
);

    assign out = ~(in1 ^ in2) ^ in3;

endmodule
