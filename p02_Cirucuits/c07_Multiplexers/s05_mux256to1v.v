//
//
// https://hdlbits.01xz.net/wiki/Mux256to1v
//
//

`default_nettype none

module top_module( 
    input   [1023:0]    in,
    input   [7:0]       sel,
    output  [3:0]       out
);

    assign out = {in[{sel, 2'b11}], in[{sel, 2'b10}], in[{sel, 2'b01}], in[{sel, 2'b00}]};

endmodule