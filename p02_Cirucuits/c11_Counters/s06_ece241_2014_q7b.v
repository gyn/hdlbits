//
//
// https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q7b
//
//

`default_nettype none

module top_module (
    input           clk,
    input           reset,
    output          OneHertz,
    output  [2:0]   c_enable
);

    wire    [3:0]   bcd0;
    bcdcount counter0 (
        .clk    ( clk           ),
        .reset  ( reset         ),
        .enable ( c_enable[0]   ),
        .Q      ( bcd0          )
    );

    wire    [3:0]   bcd1;
    bcdcount counter1 (
        .clk    ( clk           ),
        .reset  ( reset         ),
        .enable ( c_enable[1]   ),
        .Q      ( bcd1          )
    );

    wire    [3:0]   bcd2;
    bcdcount counter2 (
        .clk    ( clk           ),
        .reset  ( reset         ),
        .enable ( c_enable[2]   ),
        .Q      ( bcd2          )
    );

    assign c_enable[0] = 1'b1;
    assign c_enable[1] = (bcd0 == 4'd9);
    assign c_enable[2] = (bcd1 == 4'd9) & c_enable[1];

    assign OneHertz = (bcd2 == 4'd9) && c_enable[2];
endmodule