//
//
// https://hdlbits.01xz.net/wiki/Rotate100
//
//

`default_nettype none

module top_module (
    input               clk,
    input               load,
    input       [1:0]   ena,
    input       [99:0]  data,
    output  reg [99:0]  q
);

    reg         [99:0]  q_next;
    always @(posedge clk) begin
            q <= q_next;
    end

    always @(*) begin
        if (load)
            q_next = data;
        else
            case (ena)
            2'b01   : q_next = {q[0], q[99:1]};
            2'b10   : q_next = {q[98:0], q[99]};
            default : q_next = q;
            endcase
    end

endmodule