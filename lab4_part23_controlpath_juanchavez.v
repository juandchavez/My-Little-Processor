`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2021 10:00:24 PM
// Design Name: 
// Module Name: FSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Note that the muxes and ALU update real time but the 
// D Flip-Flops need a clock to update Q to the value at D. I do believe they
// still latch onto old memory on active low
//////////////////////////////////////////////////////////////////////////////////


module controlpath(CLK, RESET, CLR, W, CE, SEL, S);
    input CLK, RESET;
    output reg CLR;
    output reg [3:0] CE;
    output reg [2:0] W, S;
    output reg [1:0] SEL;
    
    reg[2:0] curr_state, next_state;
    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100,
              S5 = 3'b101;
              
    always@(posedge CLK or posedge RESET)
    begin
        if(RESET)
            curr_state <= S0;
        else
            curr_state <= next_state ;
    end
    
    always@(curr_state)
    begin
        case(curr_state)
            S0: // Reset State
            begin
                CLR = 1'b1; // Reset everything
                W = 3'b000;
                CE = 4'b0000;
                SEL = 2'b11;
                S = 3'b000;
                next_state <= S1;
            end
            S1: // Load Reg state
            begin
                CLR = 1'b0;     // Don't clear the flip-flops
                W = 3'b000;     // Let the muxes select values at D0
                CE = 4'b0011;   // At the next clock let the values at D0 pass through to R0 and R1
                SEL = 2'b00;    // At the next clock select R0
                S = 3'b010;     // F = B
                next_state <= S2;
            end
            S2: // Load ALU state
            begin
                CLR = 1'b0;
                W = 3'b000;
                CE = 4'b1011;   // Now while still enableing the R0 and R1 DFF, enable the last DFF
                SEL = 2'b00;    // Let R0 to the last DFF, I believe this will reach the A port of the ALU
                S = 3'b010;     // F = B
                next_state <= S3;
            end
            S3: // Math State
            begin
                CLR = 1'b0; 
                W = 3'b000;
                CE = 4'b1011;   // Let the addition result through the DFF next clock(0011 Original)
                SEL = 2'b01;    // Now let R1 through the large mux, this should be at port B of ALU
                S = 3'b001;     // F = A + B' + Cin
                next_state <= S4;
            end
            S4: // Send Data to R2 DFF
            begin
                CLR = 1'b0;
                W = 3'b100;     // Have mux2 select result of addition
                CE = 4'b1100;   // The addition result is now at Q of last DFF, Enable the DFF of R2 for next clock
                SEL = 2'b11;    // GND mux now to avoid interfering with result
                S = 3'b011;     // F = A; A now contains the result of the additon
                next_state <= S5;
            end
            S5: // Output State
            begin
                CLR = 1'b0;
                W = 3'b100;     // Let D1 of Mux2 through
                CE = 4'b0100;   // Addition results should now be at R2
                SEL = 2'b11;    // Don't let other data go through now
                S = 3'b011;     // F = A
                next_state <= S0;
            end
        endcase
    end
endmodule
