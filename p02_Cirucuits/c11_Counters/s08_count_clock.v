//
//
// https://hdlbits.01xz.net/wiki/Count_clock
//
//

`default_nettype none

//
// Usually one module in a file is recommended.
//
module mod_n_counter #(
    parameter N = 10
)
(
    input                       clk,
    input                       reset,
    input                       enable,
    output                      tick,
    output  [$clog2(N) - 1:0]   value
);
    reg     [$clog2(N) - 1:0]   counter;

    always @(posedge clk) begin
        if (reset)
            counter <= '0;
        else
            if (enable)
                if (counter == N - 1'b1)
                    counter <= '0;
                else
                    counter <= counter + 1'b1;
            // Usually the last no-change else branch could be omitted
            else
                counter <= counter;
    end

    assign value = counter;
    assign tick  = enable && (counter == N - 1'b1);

endmodule

//
// Usually one module in a file is recommended.
//
module nibble2bcd (
    input   [3:0]   nibble,
    output  [7:0]   bcd
);

    assign bcd = (nibble > 9) ? ({4'b0, nibble} + 8'd6) : {4'b0, nibble};

endmodule

module top_module (
    input           clk,
    input           reset,
    input           ena,
    output          pm,
    output  [7:0]   hh,
    output  [7:0]   mm,
    output  [7:0]   ss
);

    wire    [5:0]   tick;

    //
    // For BCD numbers for second
    //
    assign tick[0] = ena;

    wire    [3:0]   ss_low;
    mod_n_counter #(
        .N      ( 10        )
    ) mod_n_counter_i0 (
        .clk    ( clk       ),
        .reset  ( reset     ),
        .enable ( tick[0]   ),
        .tick   ( tick[1]   ),
        .value  ( ss_low    )
    );

    wire    [2:0]   ss_high;
    mod_n_counter #(
        .N      ( 6         )
    ) mod_n_counter_i1 (
        .clk    ( clk       ),
        .reset  ( reset     ),
        .enable ( tick[1]   ),
        .tick   ( tick[2]   ),
        .value  ( ss_high   )
    );

    assign ss = {1'b0, ss_high, ss_low};

    //
    // For BCD numbers for minute
    //
    wire    [3:0]   mm_low;
    mod_n_counter #(
        .N      ( 10        )
    ) mod_n_counter_i2 (
        .clk    ( clk       ),
        .reset  ( reset     ),
        .enable ( tick[2]   ),
        .tick   ( tick[3]   ),
        .value  ( mm_low    )
    );

    wire    [2:0]   mm_high;
    mod_n_counter #(
        .N      ( 6         )
    ) mod_n_counter_i3 (
        .clk    ( clk       ),
        .reset  ( reset     ),
        .enable ( tick[3]   ),
        .tick   ( tick[4]   ),
        .value  ( mm_high   )
    );

    assign mm = {1'b0, mm_high, mm_low};

    //
    // For BCD numbers for hour
    //
    wire    [3:0]   hh_nibble;
    mod_n_counter #(
        .N      ( 12         )
    ) mod_n_counter_i4 (
        .clk    ( clk       ),
        .reset  ( reset     ),
        .enable ( tick[4]   ),
        .tick   ( tick[5]   ),
        .value  ( hh_nibble )
    );

    wire    [3:0]   hh_fixed;
    assign hh_fixed = (hh_nibble == '0) ? 4'd12 : hh_nibble;

    wire    [7:0]   hh_bcd;
    nibble2bcd nibble2bcd_i0 (
        .nibble ( hh_fixed  ),
        .bcd    ( hh_bcd    )
    );

    assign hh = hh_bcd;

    //
    // For AM/PM
    //
    reg     pm_reg;
    always @(posedge clk ) begin
        if (reset)
            pm_reg <= 1'b0;
        else
            if (tick[5])
                pm_reg <= ~pm_reg;
            // Usually the last no-change else branch could be omitted
            else
                pm_reg <= pm_reg;
    end

    assign pm = pm_reg;

endmodule