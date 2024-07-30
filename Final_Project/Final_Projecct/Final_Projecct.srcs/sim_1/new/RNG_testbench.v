`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2024 05:13:33 PM
// Design Name: 
// Module Name: RNG_testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module RNG_testbench;

  reg clk;
  reg [9:0] selection;
  wire [7:0] number;

  // Instantiate RNG module
  RNG RNG_inst (
    .selection(selection), // Connect selection input
    .number(number)        // Connect number output
  );

  // Clock generation
  always #5 clk = ~clk;

  // Testbench
  initial begin
  
    // Initialize clock
    clk = 0;
    selection = 0;

    // Run simulation for 20 clock cycles
    repeat (20) begin
      // Toggle clock
      #5 clk = ~clk;
      
      // Generate random selection
      selection = selection + 3;
    end

    // End simulation
    $finish;
  end

endmodule
