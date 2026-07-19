`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2026 04:27:18 PM
// Design Name: 
// Module Name: control_path
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

module control_path#(parameter N=32)(
input  [N-1:0] inst,
output reg  branch, mem_rd, mem2reg, mem_write, alu_scr, reg_write, 
output reg [1:0] alu_op 
    );
    
    
    always_comb begin
    case(inst[6:0])
        7'b0000011:begin  // load
        alu_op=2'b00; branch=0; mem_write=0; mem_rd=1; reg_write=1; mem2reg=1; alu_scr=1;  
        end
        
        7'b0010011:begin
        alu_op=2'b11; branch=0; mem_write=0; mem_rd=0; reg_write=1; mem2reg=0; alu_scr=1;  
        end
        
        7'b0110011:begin //R-Type (add, sub)
        alu_op=2'b10; branch=0; mem_write=0; mem_rd=0; reg_write=1; mem2reg=0; alu_scr=0;  
        end
        
        7'b0100011:begin  // sw
        alu_op=2'b00; branch=0; mem_write=1; mem_rd=0; reg_write=0; mem2reg=1'b0; alu_scr=1;  //mem2reg=1'b?;
        end
        
        
        7'b1100011:begin  // beq
        alu_op=2'b01; branch=1; mem_write=0; mem_rd=0; reg_write=0; mem2reg=1'b0; alu_scr=0;  //mem2reg=1'b?;
        end
        
        default: begin
        alu_op=2'b??; branch=1'b?; mem_write=1'b?; mem_rd=1'b?; reg_write=1'b?; mem2reg=1'b?; alu_scr=1'b?;  
        end
    endcase
    end
    
    
endmodule

