`timescale 1ns / 1ps

module Winner_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in nanoseconds
  
  // Signals
  reg [5:0] A;
  reg [5:0] B;
  reg [7:0] rng;
  reg reset;
  reg start;
  wire [5:0] winner;

  // Instantiate DUT
  Winner dut (
    .A(A),
    .B(B),
    .rng(rng),
    .reset(reset),
    .start(start),
    .winner(winner)
  );

  // Clock generation
  reg clk = 0;
  always #((CLK_PERIOD / 2)) clk = ~clk;

  // Test procedure
  initial begin
    // Initialize inputs
    A = 6'b000000; // Modify these values as needed
    B = 6'b000000; // Modify these values as needed
    rng = 8'b00000000; // Modify these values as needed
    reset = 1;
    start = 0;

    // Reset
    #20 reset = 0;

    // Start
    #20 start = 1;

    // Wait for initializations to settle
    #100;

    // Test case 1: A should win
    A = 6'b000010; B = 6'b000101; rng = 8'b00011001;
    #100;

    // Test case 2: B should win
    A = 6'b000101; B = 6'b000010; rng = 8'b00110111;
    #100;

    // Test case 3: A should win
    A = 6'b000111; B = 6'b000011; rng = 8'b00011111;
    #100;

    // End simulation
    $stop;
  end

endmodule
