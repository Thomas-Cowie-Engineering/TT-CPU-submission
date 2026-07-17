module ALU (
    input [10:0] acc_out,   // Current value stored in the Accumulator
    input [10:0] reg_inp,   // Data value fetched from RAM at a specified address
    input [3:0]  ALUControl,// Opcode 
    output reg [10:0] acc_inp  // Calculated result sent to the Accumulator's input
);

    always @(*) begin
        case (ALUControl)
            4'd1: begin
                // ADD operation (LMC Code 1)
                acc_inp = acc_out + reg_inp;
            end
            
            4'd2: begin
                // SUB operation (LMC Code 2)
                acc_inp = acc_out - reg_inp;
            end
            
            4'd5: begin
                // LDA operation (LMC Code 5)
                // Pass the RAM value straight through the ALU to load into the ACC
                acc_inp = reg_inp; 
            end

            default: begin
                // Default: Pass the accumulator value through unchanged
                acc_inp = acc_out;
            end
        endcase
    end

endmodule
