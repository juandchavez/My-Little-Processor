`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 10:49:00 PM
// Design Name: 
// Module Name: mem_fsm
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
// 11-30-2021: Based on example fsm need to modify to fit the lab requirements
// 
//////////////////////////////////////////////////////////////////////////////////

module mem_fsm(clk, reset, addr, data, cs, we, oe);
    input clk, reset;
    output [5:0] addr;
    inout [3:0] data;
    output cs, we, oe;
    
    reg cs, we, oe;
    reg[4:0] addr;
    reg[3:0] data_reg;
    reg[2:0] state;
    
    parameter idle = 3'b000,
                S1 = 3'b001,    // initialize for write
                S2 = 3'b010,    // write state
                S3 = 3'b011,    // initialize for read
                S4 = 3'b100;
    assign data = data_reg;
    
    always@(posedge clk or posedge reset)
    begin
        if(reset)
        begin
            state <= idle;
            addr <= 0;
        end
        else
            case(state)
                idle: 
                begin
                    state <= S1;
                    addr <= 0;
                end
                
                S1: // initialize
                begin
                    state <= S2;
                    addr <= 0;
                end
                
                S2: // write
                begin
                    addr <= addr + 1;
                    if(addr == 31)
                        state <= S3;
                    else
                        state <= S2;
                end
               
                S3:  // initialize for read
                begin
                    state <= S4;
                    addr <= 0;
                end
                S4:  // read
                begin
                    addr <= addr + 1;
                    if(addr == 31)
                        state <= idle;
                    else
                        state <= S4;
                end
                
                default: 
                begin
                    state <= idle;
                    addr <= 0;
                end
            endcase
    end
    
    always@(state)
    begin
        case(state)
            idle: 
            begin
                cs = 0;
                we = 0;
                oe = 0;
                data_reg = 4'bzzzz;
            end
            S1: 
            begin
                cs = 1;
                we = 1;
                oe = 0;
                data_reg = 4'b1010;
            end
            S2: 
            begin
                cs = 1;
                we = 1;
                oe = 0;
                data_reg = 4'b1010;
            end         
            S3: 
            begin
                cs = 1;
                we = 0;
                oe = 1;
            end
            S4: 
            begin
                cs = 1;
                we = 0;
                oe = 1;
            end
            default: 
            begin
                cs = 0;
                we = 0;
                oe = 0;
                data_reg = 4'bzzzz;
            end    
        endcase
    end
endmodule
