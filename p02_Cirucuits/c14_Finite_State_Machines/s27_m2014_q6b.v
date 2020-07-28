//
//
// https://hdlbits.01xz.net/wiki/Exams/m2014_q6b
//
//

`default_nettype none

module top_module (
    input   [3:1]   y,
    input           w,
    output          Y2
);

    parameter       SA  = 3'b000,
                    SB  = 3'b001,
                    SC  = 3'b010,
                    SD  = 3'b011,
                    SE  = 3'b100,
                    SF  = 3'b101;

    reg     [3:1]   Y;

    always @(*) begin
        case (y)
        SA      : Y = w ? SA : SB;
        SB      : Y = w ? SD : SC;
        SC      : Y = w ? SD : SE;
        SD      : Y = w ? SA : SF;
        SE      : Y = w ? SD : SE;
        SF      : Y = w ? SD : SC;
        default : Y = SA;
        endcase
    end

    assign Y2 = Y[2];

    /* verilator lint_off UNUSED */
    wire    [1:0]   unused;
    assign unused = {Y[3], Y[1]};
    /* verilator lint_on UNUSED */

endmodule