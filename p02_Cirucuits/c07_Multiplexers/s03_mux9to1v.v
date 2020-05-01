//
//
// https://hdlbits.01xz.net/wiki/Mux9to1v
//
//

`default_nettype none

module top_module (
    input   [15:0]  a,
    input   [15:0]  b,
    input   [15:0]  c,
    input   [15:0]  d,
    input   [15:0]  e,
    input   [15:0]  f,
    input   [15:0]  g,
    input   [15:0]  h,
    input   [15:0]  i,
    input   [3:0]   sel,
    output  [15:0]  out
);

    reg     [15:0]  value;

    always @(*) begin
        case (sel)
        4'h0    : value = a;
        4'h1    : value = b;
        4'h2    : value = c;
        4'h3    : value = d;
        4'h4    : value = e;
        4'h5    : value = f;
        4'h6    : value = g;
        4'h7    : value = h;
        4'h8    : value = i;
        default : value = {16{1'b1}};
        endcase
    end

    assign out = value;

endmodule