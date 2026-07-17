


module RAM

(
input [6:0] pc_out, // input from PC that gets address of instruction.
input ram_control, // Input from CU that acts as read/write signal. 
input clk, // Clock signal
// If ram_control is 1, then read from RAM, if 0, then write to RAM.
output reg [10:0] instruction

);

reg [10:0] ram [0:99];

integer i; 

initial begin
    for (i = 0; i < 100; i = i + 1) begin
        ram[i] = 11'b0; 
    end
end

always @(posedge clk) begin
    if (ram_control) begin
        instruction = ram[pc_out]; // Read from RAM
    end else begin
        ram[pc_out] = instruction; // Write to RAM
    end
end


endmodule

