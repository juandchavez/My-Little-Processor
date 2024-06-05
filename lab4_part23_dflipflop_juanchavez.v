`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 07:22:06 PM
// Design Name: 
// Module Name: dflipflop
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


module dflipflop(D, CE, CLR, CLK, Q);
    input [3:0] D;
    input CE, CLK, CLR;
    output reg [3:0] Q;
    
    always@(posedge CLK or posedge CLR)
    begin
        if(CLR)
            Q <= 0;
        else if (CE)
            Q <= D;
    end
endmodule
