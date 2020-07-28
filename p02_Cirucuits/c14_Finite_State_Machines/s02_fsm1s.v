//
//
// https://hdlbits.01xz.net/wiki/Fsm1s
//
//

`default_nettype none

// Note the Verilog-1995 module declaration syntax here:
module top_module (clk, reset, in, out);
    input   clk;
    input   reset;      // Synchronous reset to state B
    input   in;
    output  out;

    // Fill in state name declarations
    localparam  A=1'b0;
    localparam  B=1'b1;

    reg present_state;
    reg next_state;

    always @(posedge clk) begin
        if (reset) begin  
            present_state <= B;
        end else begin
            present_state <= next_state;
        end
    end

    always @(*) begin
        case (present_state)
        A       : next_state = in ? A : B;
        B       : next_state = in ? B : A;
        default : next_state = B;
        endcase
    end

    // Output logic
    assign out = present_state;

endmodule