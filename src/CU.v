module CU(

input [10:0] instruction,
output pc_enable,
output alu_control,
output ram_control,


);
wire [3:0] opcode;
wire [6:0] operand;
assign opcode = instruction[10:7];
assign operand = instruction[6:0];


// Control signals
always @(*) begin
    pc_enable = 1'b1; // Default pc is on, incrementing.
    case(opcode)

        4'd0: begin
            //HLT operation
            pc_enable = 1'b0; // PC is disabled, halting the program.
        end
        4'd1: begin
            // ADD operation

            alu_control = 4'd1; // Set ALU control for addition

        end
        4'd2: begin
            // sub operation
            alu_control = 4'd0; // Set ALU control for subtraction
        end

        4'd3: begin
            // OR operation
        end
        default: begin
            // Default case
        end
    endcase
end

endmodule
