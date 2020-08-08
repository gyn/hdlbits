//
//
// https://hdlbits.01xz.net/wiki/Exams/review2015_count1k
//
//

`default_nettype none

module top_module #(
	parameter	MAX = 1000,
	parameter	N   = $clog2(MAX)
)
(
    input               clk,
    input               reset,
    output	[N - 1:0]   q
);

    reg     [N - 1:0]  counter;

	always @(posedge clk) begin
		if(reset)
			counter <= '0;
		else if (counter == MAX - 1'b1)
			counter <= '0;
		else
			counter <= counter + 1'b1;
	end

	assign q = counter;

endmodule
