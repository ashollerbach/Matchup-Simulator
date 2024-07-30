`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2024 12:07:13 PM
// Design Name: 
// Module Name: Final_Project
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


module Final_Project(

    );
endmodule


//create a clock wizard to call the RNG
//RNG Generation for each round
module RNG(
    input [9:0] selection, //position in RNG file, will be determined by the clock
    output [7:0] number // output from 0 - 100
);
reg [7:0] mem [0:999]; //1000 numbers from 0 - 100
initial begin
$readmemh("RNG_VALS.mem", mem, 0, 999); // load mem file
end

assign number = mem[selection]; // assign output

endmodule


//selects the winning team
module Winner(
    input [5:0] upper, //upper is the lower number (better team)
    input [5:0] lower, // lower is the higher number (worse team)
    input [7:0] rng,
    output reg [5:0] winner
);

reg [7:0] chance; //minimum number of the random number generator to predict the winning team
wire [7:0] difference;

initial begin

chance = (lower - upper) * 200 / 63; //going to change this once this project comes together

if(chance > 95) begin
chance = 95;
end

if(chance < rng) winner = upper;
else winner = lower;
end
endmodule


//Bracket simulation
module Bracket(
input start,
input [7:0] rng,
output [5:0] winner// winner to be displayed
);
//8 winners for east, best in seed
reg [5:0] E1;
reg [5:0] E2;
reg [5:0] E3;
reg [5:0] E4;
reg [5:0] E5;
reg [5:0] E6;
reg [5:0] E7;
reg [5:0] E8;

//winners of the west, second in seed
reg [5:0] W1;
reg [5:0] W2;
reg [5:0] W3;
reg [5:0] W4;
reg [5:0] W5;
reg [5:0] W6;
reg [5:0] W7;
reg [5:0] W8;

//winners of the midwest, third in seed
reg [5:0] M1;
reg [5:0] M2;
reg [5:0] M3;
reg [5:0] M4;
reg [5:0] M5;
reg [5:0] M6;
reg [5:0] M7;
reg [5:0] M8;

//Winners of the south, fourth in seed
reg [5:0] S1;
reg [5:0] S2;
reg [5:0] S3;
reg [5:0] S4;
reg [5:0] S5;
reg [5:0] S6;
reg [5:0] S7;
reg [5:0] S8;

//Sweet 16//////////////////////////////////////

//east
reg [5:0] SSE1;
reg [5:0] SSE2;
reg [5:0] SSE3;
reg [5:0] SSE4;

//west
reg [5:0] SSW1;
reg [5:0] SSW2;
reg [5:0] SSW3;
reg [5:0] SSW4;

//midwest
reg [5:0] SSM1;
reg [5:0] SSM2;
reg [5:0] SSM3;
reg [5:0] SSM4;

//south
reg [5:0] SSS1;
reg [5:0] SSS2;
reg [5:0] SSS3;
reg [5:0] SSS4;

//Elite Eight////////////////////////////////////
reg [5:0] EEE1;
reg [5:0] EEE2;
reg [5:0] EEW1;
reg [5:0] EEW2;
reg [5:0] EEM1;
reg [5:0] EEM2;
reg [5:0] EES1;
reg [5:0] EES2;

//final four
reg [5:0] FFE;
reg [5:0] FFW;
reg [5:0] FFM;
reg [5:0] FFS;

//semifinals
reg [5:0] SF1;
reg [5:0] SF2;

//champtionship
reg [5:0] CH;


reg [5:0] upper = 6'b111111;
reg [5:0] lower = 6'b000000;
reg [5:0] counter = 6'b000000;

always @(posedge start) begin

//R64 East
case(counter)
6'b000000: begin
Winner W1(6'b000000, 6'b111111, rng, E1);

end
















endcase

counter = counter +1;
endmodule