# Project_16_bit_CPU Documentation

## Introduction

This document outlines the development and integration of a 16-bit CPU. The project focuses on creating and integrating two main components: the control unit and the datapath. These units are merged to form a fully functional processor capable of executing a predefined set of instructions.

## Design

### Controller Unit

The Controller unit includes:

- **Instruction Memory**: Holds CPU instructions.
- **Program Counter (PC)**: A counter that increments as long as the clear signal is active.
- **Instruction Register (IR)**: Stores the current instruction being executed.
- **State Machine**: Manages the sequence of operations based on the current state.

### Datapath

The Datapath contains:

- **Data Memory**: Holds data for operations.
- **Mux 2-to-1**: Decides output based on the ALU input or the read data.
- **Register File**: Stores instruction or address.
- **Arithmetic Logic Unit (ALU)**: Performs computations.

### Processor Integration

Integrates the control unit and datapath with appropriate connections to ensure functionality and performance.

## Test Procedures and Results

- **ControllerStateMachine_tb (FSM_tb)**: Validates the Finite State Machine's state transitions.
- **Controller_tb**: Tests the Controller module for proper initialization and state management.
- **Datapath_tb**: Assesses the datapath for correct ALU operations and data handling.
- **testProcessor**: Ensures the entire processor unit functions as expected.

## Observations

Issues like incorrect RFSelect width were identified and corrected using debugging techniques, underscoring the importance of adherence to specifications.

## Conclusion

The project highlighted the importance of modular design and teamwork, providing a valuable learning experience in the design and implementation of a functional CPU.

## References

- _Computer Organization and Design MIPS Edition_

## Appendix

- Includes detailed schematics and additional test results.
