//
//
// https://hdlbits.01xz.net/wiki/Truthtable1
//
//

`default_nettype none

module top_module( 
    input   x3,
    input   x2,
    input   x1,
    output  f
);

    reg value;
    always @(*) begin
        case ({x3, x2, x1})
        3'b000 : value = 1'b0;
        3'b001 : value = 1'b0;
        3'b010 : value = 1'b1;
        3'b011 : value = 1'b1;
        3'b100 : value = 1'b0;
        3'b101 : value = 1'b1;
        3'b110 : value = 1'b0;
        3'b111 : value = 1'b1;
        endcase
    end

    assign f = value;

endmodule