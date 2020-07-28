//
//
// https://hdlbits.01xz.net/wiki/Exams/m2014_q6
//
//

`default_nettype none

module top_module (
    input           clk,
    input           reset,
    input           w,
    output          z
);

    parameter       SA  = 3'b000,
                    SB  = 3'b001,
                    SC  = 3'b010,
                    SD  = 3'b011,
                    SE  = 3'b100,
                    SF  = 3'b101;

    reg     [2:0]   state;
    reg     [2:0]   state_next;

    always @(posedge clk) begin
        if (reset)
            state <= SA;
        else
            state <= state_next;
    end

    always @(*) begin
        case (state)
        SA      : state_next = w ? SA : SB;
        SB      : state_next = w ? SD : SC;
        SC      : state_next = w ? SD : SE;
        SD      : state_next = w ? SA : SF;
        SE      : state_next = w ? SD : SE;
        SF      : state_next = w ? SD : SC;
        default : state_next = SA;
        endcase
    end

    assign z = (state == SE) | (state == SF);

endmodule