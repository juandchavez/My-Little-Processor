`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 09:22:51 PM
// Design Name: 
// Module Name: datapath_tb
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


module datapath_tb;
    reg [3:0] M0, M1, M2, CE; // 4-bit inputs
    reg [2:0] W, S;           // 3-bit inputs
    reg [1:0] SEL;            // 2-bit inputs 
    reg CIN, CLR, CLK;         // 1-bit input
    wire [3:0] R0, R1, R2;    // R output
    
    datapath dut(CLK, M0, M1, M2, CIN, CLR, W, CE, SEL, S, R0, R1, R2);
    
    initial CLK = 0;
    always #5 CLK = ~CLK;
    
    initial
    begin
        M0 = 4'b1100; M1 = 4'b1101; M2 = 0; CIN = 1; CLR = 1; 
        CE = 4'b0000; W = 3'b000; S = 3'b000; SEL = 2'b00; #10
        CLR = 0;
        CE = 4'b0011; W = 3'b000; S = 3'b010; SEL = 2'b00; #10
        CE = 4'b1011; W = 3'b000; S = 3'b010; SEL = 2'b00; #10
        CE = 4'b0011; W = 3'b000; S = 3'b001; SEL = 2'b01; #10
        CE = 4'b1000; W = 3'b000; S = 3'b001; SEL = 2'b01; #10
        CE = 4'b0100; W = 3'b100; S = 3'b001; SEL = 2'b01; #10
        CE = 4'b0000; W = 3'b000; S = 3'b000; SEL = 2'b00; #10
        $stop;
    end
    
endmodule
