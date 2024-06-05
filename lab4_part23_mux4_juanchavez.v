`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 08:10:06 PM
// Design Name: 
// Module Name: mux4
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


module mux4(D0, D1, D2, D3, SEL, Y);
    input [3:0] D0, D1, D2, D3;
    input [1:0] SEL;   
    output reg [3:0] Y;
    
    always@(D0 or D1 or D2 or D3 or SEL)
    begin
        case(SEL)
            2'b00: Y = D0;
            2'b01: Y = D1;
            2'b10: Y = D2;
            2'b11: Y = D3;
        endcase
    end
endmodule
