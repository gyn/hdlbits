//
//
// https://hdlbits.01xz.net/wiki/Mt2015_eq2
//
//

`default_nettype none

module top_module (
    input   [1:0]   A,
    input   [1:0]   B,
    output          z
); 

    assign z = (A == B);

endmodule