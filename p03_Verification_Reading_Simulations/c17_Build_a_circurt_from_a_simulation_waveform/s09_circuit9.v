//
//
// https://hdlbits.01xz.net/wiki/Sim/circuit9
//
//

`default_nettype none

module top_module (
    input           clk,
    input           a,
    output  [3:0]   q
);

    reg     [3:0]   r;
    always @(posedge clk) begin
        if(a)
            r <= 4'd4;
        else if (q == 4'd6)
            r <= 4'd0;
        else
            r <= r + 1'b1;
    end

    assign q = r;

endmodule
