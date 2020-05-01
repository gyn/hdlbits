//
//
// https://hdlbits.01xz.net/wiki/Exams/ece241_2013_q12
//
//

`default_nettype none

module top_module (
    input           clk,
    input           enable,
    input           S,
    input           A,
    input           B, 
    input           C,
    output  reg     Z
);

    reg     [7:0]  q_reg;
    always @(posedge clk) begin
        if (enable)
            q_reg <= {q_reg[6:0], S};
        // Usually the last no-change else branch could be omitted
        else
            q_reg <= q_reg;
    end

    always @(*) begin
        case({A, B, C})
        3'b000 : Z = q_reg[0];
        3'b001 : Z = q_reg[1];
        3'b010 : Z = q_reg[2];
        3'b011 : Z = q_reg[3];
        3'b100 : Z = q_reg[4];
        3'b101 : Z = q_reg[5];
        3'b110 : Z = q_reg[6];
        3'b111 : Z = q_reg[7];
        endcase
    end

    //
    // The following code also works :
    //
    // assign Z = q_reg[{A, B, C}];
    //
    // I will check which one is better
    //

endmodule