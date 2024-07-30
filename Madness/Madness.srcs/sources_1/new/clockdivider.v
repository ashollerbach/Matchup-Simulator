`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2024 06:16:10 PM
// Design Name: 
// Module Name: clockdivider
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


module clockdivider(
input clk_src_5MHz,
    output reg clk_1kHz
    );
    
    reg [23:0] counter = 0;
    
    always @(posedge clk_src_5MHz) begin
        if (counter == 5000) begin
            counter <= 0;
            clk_1kHz <= ~clk_1kHz;
        end else begin
            counter <= counter + 1;
        end
    end

    
    
    
endmodule
