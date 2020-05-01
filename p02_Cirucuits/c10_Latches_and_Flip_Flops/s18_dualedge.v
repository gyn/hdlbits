//
//
// https://hdlbits.01xz.net/wiki/Dualedge
//
// https://zhuanlan.zhihu.com/p/61695679
// https://www.reddit.com/r/FPGA/comments/b8xtqm/a_dual_edge_triggered_flipflop_in_verilog/ek1tddc/
//

`default_nettype none

module top_module (
    input   clk,
    input   d,
    output  q
);

    reg reg_p;
    always @(posedge clk) begin
            reg_p <= d ^ reg_n;
    end

    reg reg_n;
    always @(negedge clk) begin
            reg_n <= d ^ reg_p;
    end

    assign q = reg_p ^ reg_n;

endmodule