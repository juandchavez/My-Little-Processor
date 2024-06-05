`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 06:50:46 PM
// Design Name: 
// Module Name: datapath
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


module datapath( CLK, M0, M1, M2, CIN, CLR, W, CE, SEL, S, R0, R1, R2);
    input [3:0] M0, M1, M2, CE; // 4-bit inputs
    input [2:0] W, S;           // 3-bit inputs
    input [1:0] SEL;            // 2-bit inputs 
    input CIN, CLR,CLK;         // 1-bit input
    output [3:0] R0, R1, R2;    // R output
    
    wire GND;
    wire [3:0] Y0, Y1, Y2, Y3, A, B;
    
    assign GND = 4'b0000;
    
    // Upper three multiplexers
    mux mux0(M0, A, W[0], Y0);
    mux mux1(M1, A, W[1], Y1);
    mux mux2(M2, A, W[2], Y2);
    
    // Upper three D Flip-Flops
    dflipflop dff0(Y0, CE[0], CLR, CLK, R0);
    dflipflop dff1(Y1, CE[1], CLR, CLK, R1);
    dflipflop dff2(Y2, CE[2], CLR, CLK, R2);
    
    // Central 4 input multiplexer
    mux4 mux40(R0,R1,R2,GND,SEL,B);
    
    // ALU
    alu alu0(A, B, S, CIN, Y3);
    
    // Lower D Flip-Flop
    dflipflop dff3(Y3, CE[3], CLR, CLK, A);
endmodule
