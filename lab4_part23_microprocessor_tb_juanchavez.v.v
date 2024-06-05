`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2021 11:21:41 PM
// Design Name: 
// Module Name: microprocessor_tb
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


module microprocessor_tb;
    reg SW1, CLK, CIN;
    reg [3:0] M0, M1, M2;
    
    wire [3:0] R0, R1, R2;
    
    microprocessor dut(CLK, SW1, M0, M1, M2, CIN, R0, R1, R2);
    
    initial CLK = 1;
    always #10 CLK = ~CLK;
    
    initial
    begin
        M0 = 4'b1100; M1 = 4'b1101; M2 = 4'b0000; CIN = 1;
        SW1 = 1; #20
        SW1 = 0; #100
        M0 = 4'b0001; M1 = 4'b1001; M2 = 4'b0000; CIN = 1;
        SW1 = 1; #20
        SW1 = 0; #100
        M0 = 4'b0110; M1 = 4'b0110; M2 = 4'b0000; CIN = 0;
        SW1 = 1; #20
        SW1 = 0; #100
        $stop;
    end
endmodule
