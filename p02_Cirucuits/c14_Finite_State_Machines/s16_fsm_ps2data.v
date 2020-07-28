//
//
// https://hdlbits.01xz.net/wiki/Fsm_ps2
//
//

`default_nettype none

module top_module (
    input           clk,
    input   [7:0]   in,
    input           reset,
    output  [23:0]  out_bytes,
    output          done
);

    parameter       WAIT_B1 = 4'b0001,
                    WAIT_B2 = 4'b0010,
                    WAIT_B3 = 4'b0100,
                    DONE    = 4'b1000;

    reg     [3:0]   state;
    reg     [3:0]   state_next;

    // State transition logic (combinational)
    always @(*) begin
        case (state)
        WAIT_B1 : state_next = in[3] ? WAIT_B2 : WAIT_B1;
        WAIT_B2 : state_next = WAIT_B3;
        WAIT_B3 : state_next = DONE;
        DONE    : state_next = in[3] ? WAIT_B2 : WAIT_B1;
        default : state_next = WAIT_B1;
        endcase
    end

    // State flip-flops (sequential)
    always @(posedge clk) begin
        if(reset) begin
            state <= WAIT_B1;
        end else begin
            state <= state_next;
        end
    end

    // Output logic
    assign done = (state == DONE);

    reg     [23:0]  data;
    always @(posedge clk) begin
        if (reset) begin
            data <= '0;
        end else begin
            data <= {data[15:0], in};
        end
    end

    assign out_bytes = data;

endmodule