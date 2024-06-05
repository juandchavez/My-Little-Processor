`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 10:21:47 PM
// Design Name: 
// Module Name: ram_ex
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


module ram(addr, data, cs, we, oe);
    input cs,   // chip select
          we,   // write enable
          oe;   // output enable
    input [4:0] addr;   //  5-bit address bus; 
    inout [3:0] data;   // 4-bit data bus
    
    reg [3:0] data_out; // 4-bit data output
    reg[3:0] mem [0:31];  // 5-bit address bus; 4-bit data bus
    
    assign data = (cs && oe && !we) ? data_out: 4'bzzzz;
    // memory write
    always@(cs or we or data or addr)
    begin
        // cs = 1 and we = 1
        if(cs && we)
            // write the data to this address location in memory
            mem[addr] = data;
    end
    // memory read
    always@(cs or we or data or addr)
    begin
        // cs = 1 and we = 0 and oe = 1
        if(cs && !we && oe)
            // read from this addrress location
            data_out = mem[addr];
    end
endmodule
