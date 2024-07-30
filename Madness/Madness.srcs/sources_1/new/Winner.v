`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 04:59:16 PM
// Design Name: 
// Module Name: Winner
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


//selects the winning team
module Winner(
    input [5:0] A, //upper is the lower number (better team)
    input [5:0] B, // lower is the higher number (worse team)
    input [7:0] rng, // if this value is higher than the value in the funciton below, team B wins
    input reset, // sets winner to 0
    input start, // this triggers on start
    output reg [5:0] winner // winner between A and B
);

reg [7:0] chance; //minimum number of the random number generator to predict the winning team
wire [7:0] difference;
reg [5:0] upper;
reg [5:0] lower;

always@(start) begin

if(A > B) begin
upper <= B;
lower <= A;
end else begin
upper <= A;
lower <= B;
end

chance = (lower - upper) * 95 / 63; //going to change this once this project comes together

if(chance > 95) begin
chance = 95;
end

if(chance < rng) winner = upper;
else winner = lower;
end

always@(reset) begin
winner = 6'b000000;
end

endmodule
