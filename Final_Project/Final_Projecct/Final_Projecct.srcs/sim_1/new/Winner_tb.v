`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2024 12:43:29 PM
// Design Name: 
// Module Name: Winner_tb
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
module Winner_tb;

reg [5:0] upper = 6'b000000;
reg [5:0] lower = 6'b111111;
reg [7:0] rng;
wire [5:0] winner;


// Instantiate Winner module
Winner Winner_inst(
    .upper(upper),
    .lower(lower),
    .rng(rng),
    .winner(winner)
);

initial begin
    // Initialize upper, lower, and rng
    upper = 6'b000000;
    lower = 6'b111111;
    rng = 100;

    // Test different scenarios
    #10; // Wait a bit before changing inputs

    // Test case 1: When chance is less than rng
    upper = 6'b001000;
    lower = 6'b110111;
    rng = 8'b00001111; // Set rng such that it's greater than chance
    #10; // Wait for some time

    // Test case 2: When chance is greater than rng
    upper = 6'b001000;
    lower = 6'b110111;
    rng = 8'b11110000; // Set rng such that it's less than chance
    #10; // Wait for some time

    // Add more test cases as needed...

    // End simulation
    $finish;
end

endmodule

