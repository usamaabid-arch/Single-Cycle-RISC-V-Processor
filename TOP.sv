`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2026 04:23:08 PM
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

module top#(parameter N=32, D=32, width=32)(
//input logic [N-1:0] 
input logic clk, reset 
  
//output  logic [N-1:0]
    );
     logic [1:0] alu_op;  
wire   branch, mem_rd, mem2reg, mem_write, alu_scr, reg_write, zero, sel_b; 
wire [N-1:0] pc_out, inst, data_w /* D_mux_out  */,  immout, mdata2/* R_mux_data2  */, data2, dmem_out/* in_mux_data_w  */,A0,A1,mux_out,data1, alu_out ;
wire [3:0] alu_ctrl;
    

    
pc pro( 
mux_out, 
clk, reset, 
pc_out 
);


instructionMemory INST(
pc_out, 
inst 
);


registerData regfile(
inst, 
reg_write, reset, clk, 
data_w, 
data1, data2 
);



Immediate_gen imm( 
inst, 
immout 
);

control_path m_control (
inst,
branch, mem_rd, mem2reg, mem_write, alu_scr, reg_write, 
alu_op 
);


alu_control addr_control (
alu_op, 
inst, 
alu_ctrl 
); 

alu ADDR( 
alu_ctrl, 
data1, mdata2, 
alu_out, 
zero              
// = (alu_out == 0) 
); 

data_memory storgge
( 
alu_out, data2, 
mem_write, mem_rd, clk, reset, 
 dmem_out 
);


mux im_ALU(
.In1(data2),.In2(immout),
.sel(alu_scr),
 .out(mdata2)
    );
    
    
 mux data_mem(
.In1(alu_out),.In2(dmem_out),  
.sel(mem2reg),
 .out(data_w)
    );   
 
 
 adder pc_4(
.In1(pc_out),.In2(32'd4),
 .sum(A0)

    );   


 adder pc_j(
.In1(pc_out),.In2(immout),  //shift left one
 .sum(A1)
    );
    
   mux add_pc(
.In1(A0),.In2(A1),
.sel(sel_b),
 .out(mux_out)
    ); 
    
 AND_B m_se(
 .a(branch),.b(zero),
 .c(sel_b)
    );   
      
endmodule

