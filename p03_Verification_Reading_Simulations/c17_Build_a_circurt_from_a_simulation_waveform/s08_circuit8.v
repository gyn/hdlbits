//
//
// https://hdlbits.01xz.net/wiki/Sim/circuit8
//
// Be carefull when testing this module on FPGA
//
//

`default_nettype none

module top_module (
    input   clock,
    input   a,
    output  p,
    output  q
);

    reg     r;
    always @(negedge clock) begin
        r <= a;
    end

    assign q = r;

    assign p = clock ? a : p;

endmodule
