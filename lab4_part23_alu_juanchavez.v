`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 08:16:39 PM
// Design Name: 
// Module Name: alu
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


module alu(A, B, S, CIN, Y);
    input [3:0] A, B;
    input [2:0] S;
    input CIN;
    output reg [3:0] Y;
    
    always@(A or B or S or CIN or Y)
    begin 
        case(S)
            3'b000: Y <= A + B + CIN;
            3'b001: Y = A + ~B + CIN;
            3'b010: Y = B;
            3'b011: Y = A;
            3'b100: Y = A&B;
            3'b101: Y = A|B;
            3'b110: Y = ~A;
            3'b111: Y = A ^ B;
        endcase
    end
endmodule
