`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2021 01:07:09 AM
// Design Name: 
// Module Name: top
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


module sram(clk, reset, data);
    input clk, reset;
    inout [3:0] data;
    wire cs, we, oe;
    wire [5:0] addr;
    
    mem_fsm g1(clk, reset, addr[5:0], data[3:0], cs, we, oe);
    ram g2(addr[5:0], data[3:0], cs, we, oe);    
endmodule
