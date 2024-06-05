`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 08:44:09 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;
    reg [3:0] A, B;
    reg [2:0] S;
    reg CIN;
    wire [3:0] Y;
    
    alu dut(A, B, S, CIN, Y);
    
    initial
    begin
        A = 1; B = 1; CIN = 0;
        S = 0; #10
        S = 1; #10
        S = 2; #10
        S = 3; #10
        S = 4; #10
        S = 5; #10
        S = 6; #10   
        S = 7; #10
        CIN = 1;
        S = 0; #10
        S = 1; #10
        S = 2; #10
        S = 3; #10
        S = 4; #10
        S = 5; #10
        S = 6; #10   
        S = 7; #10
        #10 $stop;
    end
endmodule
