`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 04:54:47 PM
// Design Name: 
// Module Name: Main
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


module Main(
    input [5:0] A, //team 1
    input [5:0] B, // team 2
    input start, //winner selection should start here
    input clk,
    input reset,
    output reg [5:0] winner, //winning team
    output [6:0] segment, //display
    output [7:0] AN //display
    );
    
    wire number;
    wire clk_src_5MHz;
    wire clk_1kHz;
    wire selection = 10'b1100110010;
    
  clk_wiz_0 clk_5MHz(
        .clk_in1(clk), 
        .clk_out1(clk_src_5MHz), 
        .locked(),
        .reset(reset)
    );
    
    RNG RNG1(
    .selection(selection),
    .clock(clk_1kHz),
    .reset(reset),
    .number(number)    
    );
 /*   
    Winner Winner(
    .A(A),
    .B(B),
    .start(start),
    .rng(number),
    .reset(reset),
    .winner(winner)
    );
    */
    
   // Bracket Bracket();
    
 /*   SSDisplay SSdisplay(
    .winner(winner),
    .clk_1kHz(clk_1kHz),
    .segment(segment),
    .AN(AN)
    );
 */
 /*   
    clockdivider clockdivider(
    .clk_src_5MHz(clk_src_5MHz),
    .clk_1kHz(clk_1kHz)
    );
    */
endmodule
