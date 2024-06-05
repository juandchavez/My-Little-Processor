`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2021 11:01:08 PM
// Design Name: 
// Module Name: controlpath_tb
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


module controlpath_tb;
    reg CLK, RESET;
    wire CLR;
    wire [1:0] SEL;
    wire [2:0] W, S;
    wire [3:0] CE;
    
    controlpath dut(CLK, RESET, CLR, W, CE, SEL, S);
    
    initial CLK = 1;
    always #10 CLK = ~CLK;
    
    initial
    begin
        RESET = 1; #20
        RESET = 0; #120
        $stop;
    end
endmodule
