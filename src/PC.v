module PC (
    input clk, // Clock signal
    input ena, // Input from CU that acts as enable signal for PC.
    input rst, // Reset signal, active high
    input branch, // Input from CU that acts as branch signal for PC.
    input [6:0] pc_branch, 
    output reg [6:0] pc_out // Output to RAM that gets address of instruction.
);

always@(posedge clk) begin
    if (!rst) begin
        if (ena) begin
            if (branch) begin
                pc_out <= pc_branch; // Branch to the specified address
            end else begin
                pc_out <= pc_out + 1; // Increment PC by 1
            end
        end
    end else begin
        pc_out <= 7'b0; // Reset PC to 0
    end
end

endmodule




