//
//
// https://hdlbits.01xz.net/wiki/Shift4
//
//

`default_nettype none

module top_module(
    input               clk,
    input               areset,
    input               load,
    input               ena,
    input       [3:0]   data,
    output  reg [3:0]   q
); 

    wire    [3:0]   q_next;
    always @(posedge clk, posedge areset) begin
        if (areset)
            q <= '0;
        else
            q <= q_next;
    end


    assign q_next = (load) ? data :
                             (ena ? {1'b0, q[3:1]} : q);

endmodule
