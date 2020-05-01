//
//
// https://hdlbits.01xz.net/wiki/Exams/ece241_2013_q7
//
//

`default_nettype none

module top_module (
    input   clk,
    input   j,
    input   k,
    output  Q
); 

    reg     q_r;
    always @(posedge clk) begin
        case ({j, k})
        2'b00 : q_r <= q_r;
        2'b01 : q_r <= 1'b0;
        2'b10 : q_r <= 1'b1;
        2'b11 : q_r <= ~q_r;
        endcase
    end

    assign Q = q_r;

endmodule