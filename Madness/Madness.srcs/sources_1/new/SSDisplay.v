`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 09:53:23 PM
// Design Name: 
// Module Name: SSDisplay
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


module SSDisplay(
    input [5:0] winner,
    input clk_1kHz,
    output reg [6:0] segment,
    output reg [7:0] AN 
    );
    
    reg ones, tens;
    
    always @ (clk_1kHz) begin
    
    ones = winner % 10;
            case(ones)
            0   :segment=7'b0000001;
            1   :segment=7'b1001111;
            2   :segment=7'b0010010;
            3   :segment=7'b0000110;
            4   :segment=7'b1001100;
            5   :segment=7'b0100100;
            6   :segment=7'b0100000;
            7   :segment=7'b0001111;
            8   :segment=7'b0000000;
            9   :segment=7'b0000100;
            default: segment=7'bx;
            endcase 
      AN = 8'b11111110;
            
     tens = winner / 10;
        case(tens)
        0   :segment=7'b0000001;
        1   :segment=7'b1001111;
        2   :segment=7'b0010010;
        3   :segment=7'b0000110;
        4   :segment=7'b1001100;
        5   :segment=7'b0100100;
        6   :segment=7'b0100000;
        7   :segment=7'b0001111;
        8   :segment=7'b0000000;
        9   :segment=7'b0000100;
        default: segment=7'bx;
        endcase
        AN = 8'b11111101;
        end
endmodule
