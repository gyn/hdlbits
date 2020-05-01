//
//
// https://hdlbits.01xz.net/wiki/Conwaylife
//
//

`default_nettype none

function integer NIBBLE;
    input integer i;
    begin
        NIBBLE = (i + 16) & 15;
    end
endfunction

function integer Y;
    input integer i;
    begin
        Y = i & 15;
    end
endfunction

function integer X;
    input integer i;
    begin
        X = (i >> 4 ) & 15;
    end
endfunction

function integer POS;
    input integer x;
    input integer y;
    begin
        POS = (x << 4) + y;
    end
endfunction

module cell_state (
    input   [8:0]   bits,
    output  reg     alive
);

    always @(*) begin
        case ({bits[8:5], bits[3:0]})
        8'h03, 8'h05, 8'h06, 8'h09,
        8'h0a, 8'h0c, 8'h11, 8'h12,
        8'h14, 8'h18, 8'h21, 8'h22,
        8'h24, 8'h28, 8'h30, 8'h41,
        8'h42, 8'h44, 8'h48, 8'h50,
        8'h60, 8'h81, 8'h82, 8'h84,
        8'h88, 8'h90, 8'ha0, 8'hc0 : alive = bits[4];
        8'h07, 8'h0b, 8'h0d, 8'h0e,
        8'h13, 8'h15, 8'h16, 8'h19,
        8'h1a, 8'h1c, 8'h23, 8'h25,
        8'h26, 8'h29, 8'h2a, 8'h2c,
        8'h31, 8'h32, 8'h34, 8'h38,
        8'h43, 8'h45, 8'h46, 8'h49,
        8'h4a, 8'h4c, 8'h51, 8'h52,
        8'h54, 8'h58, 8'h61, 8'h62,
        8'h64, 8'h68, 8'h70, 8'h83,
        8'h85, 8'h86, 8'h89, 8'h8a,
        8'h8c, 8'h91, 8'h92, 8'h94,
        8'h98, 8'ha1, 8'ha2, 8'ha4,
        8'ha8, 8'hb0, 8'hc1, 8'hc2,
        8'hc4, 8'hc8, 8'hd0, 8'he0 : alive = 1'b1;
        default                    : alive = 1'b0;
        endcase
    end

endmodule

module top_module (
    input           clk,
    input           load,
    input   [255:0] data,
    output  [255:0] q
);

    reg     [255:0] q_reg;
    wire    [255:0] q_next;
    always @(posedge clk) begin
        if (load)
            q_reg <= data;
        else
            q_reg <= q_next;
    end

    //
    //
    //
    generate
        genvar i;
        for (i = 0; i < 256; i = i + 1) begin : loop
            wire    [8:0]   cells;

            assign cells = {
                q_reg[POS(NIBBLE(X(i) - 1), NIBBLE(Y(i) + 1))],
                q_reg[POS(NIBBLE(X(i)    ), NIBBLE(Y(i) + 1))],
                q_reg[POS(NIBBLE(X(i) + 1), NIBBLE(Y(i) + 1))],
                q_reg[POS(NIBBLE(X(i) - 1), NIBBLE(Y(i)    ))],
                q_reg[POS(NIBBLE(X(i)    ), NIBBLE(Y(i)    ))],
                q_reg[POS(NIBBLE(X(i) + 1), NIBBLE(Y(i)    ))],
                q_reg[POS(NIBBLE(X(i) - 1), NIBBLE(Y(i) - 1))],
                q_reg[POS(NIBBLE(X(i)    ), NIBBLE(Y(i) - 1))],
                q_reg[POS(NIBBLE(X(i) + 1), NIBBLE(Y(i) - 1))]
            };

            cell_state cell_state_i(
                .bits   ( cells     ),
                .alive  ( q_next[i] )
            );
        end
    endgenerate

    assign q = q_reg;

endmodule
