//
//
// https://hdlbits.01xz.net/wiki/Shift18
//
//

`default_nettype none

module top_module (
    input               clk,
    input               load,
    input               ena,
    input       [1:0]   amount,
    input       [63:0]  data,
    output  reg [63:0]  q
);

    reg         [63:0]  q_next;
    always @(posedge clk) begin
            q <= q_next;
    end

    always @(*) begin
        if (load)
            q_next = data;
        else
            if (ena)
                case (amount)
                2'b00   : q_next = {q[62:0], 1'b0};
                2'b01   : q_next = {q[55:0], 8'b0};
                2'b10   : q_next = {q[63], q[63:1]};
                2'b11   : q_next = {{8{q[63]}}, q[63:8]};
                endcase
            else
                q_next = q;
    end

endmodule
