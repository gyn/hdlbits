//
//
// https://hdlbits.01xz.net/wiki/Popcount3
//
//

`default_nettype none

module top_module (
    input   [2:0]   in,
    output  [1:0]   out
);

    reg [1:0]   value;
    always @(*) begin
        case (in)
        3'b000 : value = 2'd0;
        3'b001 : value = 2'd1;
        3'b010 : value = 2'd1;
        3'b011 : value = 2'd2;
        3'b100 : value = 2'd1;
        3'b101 : value = 2'd2;
        3'b110 : value = 2'd2;
        3'b111 : value = 2'd3;
        endcase
    end

    assign out = value;

endmodule