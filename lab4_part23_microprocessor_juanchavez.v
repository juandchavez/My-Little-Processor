`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2021 11:14:56 PM
// Design Name: 
// Module Name: microprocessor
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


module microprocessor(CLK, SW1, M0, M1, M2, CIN, R0, R1, R2);
    input CLK, SW1, CIN;
    input [3:0] M0, M1, M2;
    output[3:0] R0, R1, R2;
    
    wire CLR;
    wire [1:0] SEL;
    wire [2:0] W,S;
    wire [3:0] CE;
    
    controlpath fsm(CLK, SW1, CLR, W, CE, SEL, S);
    datapath data(CLK, M0, M1, M2, CIN, CLR, W, CE, SEL, S, R0, R1, R2);
    
endmodule
