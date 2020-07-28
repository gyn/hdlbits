//
//
// https://hdlbits.01xz.net/wiki/exams/2014_q3fsm
//
//

`default_nettype none

module top_module (
    input           clk,
    input           reset,
    input           s,
    input           w,
    output          z
);

    parameter       SA  = 2'b00,
                    SB  = 2'b01,
                    SB1 = 2'b10,
                    SB2 = 2'b11;

    reg     [1:0]   state;
    reg     [1:0]   state_next;

    always @(posedge clk) begin
        if (reset)
            state <= SA;
        else
            state <= state_next;
    end

    always @(*) begin
        case (state)
        SA          : state_next = s ? SB : SA;
        SB          : state_next = SB1;
        SB1         : state_next = SB2;
        SB2         : state_next = SB;
        default     : state_next = SA;
        endcase
    end

    reg     [2:0]   reg_w;
    wire            reg_en;

    always @(posedge clk) begin
        if(reset)
            reg_w <= '0;
        else if (reg_en)
            reg_w <= {w, reg_w[2:1]};
    end

    assign reg_en = (state != SA);

    assign z = (state == SB) & (~^reg_w) & (|reg_w);

endmodule