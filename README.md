# Single-Cycle RISC-V Processor

## Overview
This repository contains the RTL implementation of a 32-bit Single-Cycle RISC-V Processor based on the RV32I base integer instruction set. The design encompasses a fully functional datapath and control unit capable of executing fundamental arithmetic, memory, and branching operations in a single clock cycle.

## Supported Instruction Set
The current iteration of the processor successfully decodes and executes the following instructions:
* **R-Type:** `ADD` (and others depending on your ALU)
* **I-Type:** `ADDI`, `LW`
* **S-Type:** `SW`
* **B-Type:** `BNE`

## Architecture Highlights
The processor is structurally modeled using interconnected sub-modules to form the complete datapath:
* **Program Counter (PC):** 32-bit register tracking the current instruction address.
* **Instruction Memory:** Read-only memory storing the executable program.
* **Register File:** 32x32-bit asynchronous read / synchronous write register array.
* **ALU (Arithmetic Logic Unit):** Handles core computational operations.
* **Immediate Generator (ImmGen):** Extracts and sign-extends immediate values from the instruction word.
* **Data Memory:** Synchronous read/write memory for load and store operations.
* **Control Path:** Combinational logic decoding the opcode and driving datapath multiplexers and write-enables.

## Module Interface (Top-Level)
*(I will generate this exact table once you paste the code)*

| Port | Direction | Size | Description |
| :--- | :--- | :--- | :--- |
| `clk` | Input | 1-bit | System clock |
| `reset` | Input | 1-bit | Asynchronous active-low reset |
