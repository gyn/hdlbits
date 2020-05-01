//
//
// https://hdlbits.01xz.net/wiki/Conditional
//
//

`default_nettype none

// synthesis verilog_input_version verilog_2001
module top_module (
    input       [15:0]  scancode,
    output reg          left,
    output reg          down,
    output reg          right,
    output reg          up
); 

    always @(*) begin
        left  = 1'b0;
        down  = 1'b0;
        right = 1'b0;
        up    = 1'b0;

        case (scancode)
        16'he06b : left  = 1'b1;
        16'he072 : down  = 1'b1;
        16'he074 : right = 1'b1;
        16'he075 : up    = 1'b1;
        default  :             ;
        endcase
    end

endmodule