`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 12:47:52 AM
// Design Name: 
// Module Name: top_tb
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


module sram_tb;
    reg clk, reset;
    wire [3:0] data;
    
    sram dut(clk, reset, data[3:0]);
    
    // set up the clock
    initial clk = 0;
    initial reset = 1;
    always #10 clk = ~clk;
    
    initial
    begin

        #20 reset = 0;
        #1000
        #10 $stop;
    end
endmodule
