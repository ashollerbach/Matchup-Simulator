`timescale 1ns / 1ps

module RNG_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in nanoseconds
  
  // Signals
  reg [9:0] selection;
  reg clock;
  reg reset;
  wire [7:0] number;

  // Instantiate DUT
  RNG dut (
    .selection(selection),
    .clock(clock),
    .reset(reset),
    .number(number)
  );

  // Memory initialization
  initial begin
    $readmemh("RNG_vals.mem", dut.mem); // Load memory file
  end

  // Clock generation
  initial begin
    clock = 0;
    forever #((CLK_PERIOD / 2)) clock = ~clock;
  end

  // Test procedure
  initial begin
    // Initialize inputs
    selection = 10'b0; // Initial selection
    reset = 1;

    // Reset
    #20 reset = 0;

    // Wait for reset to settle
    #100;

    // Test case 1: Read number at position 0
    selection = 10'b0;
    #100;

    // Test case 2: Read number at position 100
    selection = 10'b1100100;
    #100;

    // Test case 3: Read number at position 999
    selection = 10'b1111100111;
    #100;

    // End simulation
    $stop;
  end

endmodule
