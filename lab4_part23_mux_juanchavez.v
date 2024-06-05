`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 06:55:39 PM
// Design Name: 
// Module Name: mux
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


module mux(D0,D1,S,Y);
    input [3:0] D0,D1;
    input S;
    output reg [3:0] Y;
    
    always@(D0 or D1 or S)
    begin
        if(S == 0)
            Y = D0;
        else
            Y = D1;
    end
endmodule
