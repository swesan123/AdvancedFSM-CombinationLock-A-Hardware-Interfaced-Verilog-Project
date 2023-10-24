# AdvancedFSM-CombinationLock: A Hardware-Interfaced Verilog Project

## Overview

This repository contains the design and implementation of a sophisticated Finite State Machine (FSM) in Verilog, specifically devised for a Combination Lock mechanism. The project is a comprehensive showcase of digital design principles, interfacing with the DE1-SoC board, and practical application of hardware debouncing, input conditioning, and state management in creating a secure locking system.

## Features

- **Hardware Debounce:** Implementation of noise-free, reliable pushbutton inputs using hardware debounce techniques, ensuring accurate signal interpretation.
- **Input Conditioning:** Asynchronous external inputs are synchronized and conditioned to prevent signal misinterpretation, specifically within a fast clocked environment.
- **Combination Lock Logic:** A secure 4-bit combination lock, featuring enhanced security protocols like an alarm trigger upon successive incorrect entries.
- **State Management:** Utilizes Moore FSM principles for predictable, stable behavior in response to varying inputs and conditions.
- **User Feedback:** Interactive feedback through a seven-segment display and LEDs, providing system status including alarms, open signals, and configuration modes.

## Hardware Requirements

- Altera DE1-SoC Development and Education Board
- Pushbuttons and LEDs (on-board)
- Seven-segment display (on-board)

## Setup and Installation

1. **Environment Setup:** Ensure you have Quartus Prime installed for FPGA development in Verilog.
2. **Clone the Repository:** git clone https://github.com/yourusername/AdvancedFSM-CombinationLock.git
3. **Load the Project:** Open Quartus Prime and load the project files from the directory where you cloned the repository.
4. **Compile and Upload:** Follow standard procedures to compile the Verilog design and upload it to your DE1-SoC board.
5. **Hardware Setup:** Connect any additional peripherals if required, though the project is designed to use the onboard input/output devices.


## Debugging Tips

- Start with testing individual subcircuits before the complete system integration.
- Use a debounced pushbutton for initial clock pulse generation before moving to an onboard clock source.
- If encountering functionality issues, route internal state signals to LEDs to monitor system responses during operation.
- Ensure all unused DE1-SoC I/O pins are set to tri-state or have weak pull-up to prevent unpredictable behavior.
