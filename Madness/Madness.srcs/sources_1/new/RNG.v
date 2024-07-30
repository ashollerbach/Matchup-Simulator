`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 05:04:15 PM
// Design Name: 
// Module Name: RNG
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



//create a clock wizard to call the RNG
//RNG Generation for each round
module RNG(
    input [9:0] selection, //position in RNG file, will be determined by the clock
    input clock,
    input reset,
    output reg [7:0] number // output from 0 - 100
);
reg [7:0] mem [0:999]; //1000 numbers from 0 - 100
always@(posedge clock) begin
$readmemh("RNG_vals.mem", mem, 0, 999); // load mem file

number = mem[selection]; // assign output

if(reset) begin // reset function
    number = 0;
end
end
endmodule