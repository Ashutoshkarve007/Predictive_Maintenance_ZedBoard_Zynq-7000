# Predictive Maintenance System

## Title: Design and Implementation of a Predictive Maintenance System Using ZedBoard Zynq-7000

https://sway.cloud.microsoft/qh6SOmMHAOSEkLET?ref=Link

### Submitted by: ASHUTOSH RAJENDRA KARVE
**Roll Number:** 2024HT01021  
**Supervisor:** Hari Prasad  
**Subject:** Hardware Software Co-Design  
**Institute:** Bits-Pilani  
**Date:** 04-11-2024

**Git Clone:** [GitHub Repository](https://github.com/Ashutoshkarve007/Predictive_Maintenance_ZedBoard_Zynq-7000)

---

### Abstract

This project report details the design and implementation of a predictive maintenance system using the ZedBoard Zynq-7000, developed from scratch. The primary aim is to predict equipment failures in advance by monitoring simulated sensor data, thereby reducing unexpected downtime and maintenance costs. The system utilizes hardware components designed in Verilog, which are integrated with the Zynq Processing System, leveraging the capabilities of programmable logic and ARM processors for real-time data analysis and decision-making.

---

### Table of Contents

1. Project Description
   - Objective
   - Target Devices

2. Initial Setup of Project
   - Project Setup in Vivado
   - Organize Project Directory Structure

3. Development of Hardware Components
   - Data Acquisition Module
     - Design and Implementation
     - Testbench for Data Acquisition Module
   - Data Processing Module
     - Design and Implementation
     - Testbench for Data Processing Module
   - Predictive Analysis Module
     - Design and Implementation
     - Testbench for Predictive Analysis Module

4. Integration with Zynq Processing System
   - Custom AXI IP Integration
   - System Integration and Verification
   - Clock and AXI Configuration
   - Finalizing Connections

5. Generate Bitstream
   - Steps to Generate Bitstream
   - Export Hardware

6. Software Development
   - Bare-Metal Application in Vitis
   - Testing and Debugging

7. Conclusion
8. Future Work
9. References

---

## 1. Project Description

### 1.1 Objective

The primary objective of this project is to design and implement a predictive maintenance system using the ZedBoard Zynq-7000, named "PredictiveMaintenanceSystem." This system predicts equipment failures before they occur by monitoring equipment data through simulated sensors. Predictive maintenance helps reduce downtime and maintenance costs by preventing unexpected equipment failures. By continuously analyzing the health and performance of equipment, this system provides early warnings for potential malfunctions, allowing maintenance teams to take proactive measures.

### 1.2 Target Devices

The system is targeted for the ZedBoard Zynq-7000, which offers substantial flexibility for both hardware acceleration and software-driven tasks through its SoC architecture. The Zynq-7000 combines programmable logic with a dual-core ARM Cortex-A9 processor, making it suitable for real-time data processing and complex decision-making tasks required in predictive maintenance applications.

---

## 2. Initial Setup of Project

### 2.1 Project Setup in Vivado

- **Project Name and Location:** In Vivado, the project was named "PredictiveMaintenanceSystem." A clean, new directory was chosen to avoid conflicts with other projects.
- **Project Type:** Selected "RTL Project" to include RTL (Register Transfer Level) source files. The "Do not specify sources at this time" option was selected, as sources would be added later.
- **Specify Target Hardware:** Chose "Boards" to select ZedBoard Zynq-7000 directly from a list of available boards, ensuring automatic configurations for pin assignments and clock settings.

### 2.2 Organize Project Directory Structure

The directory structure was organized as follows:
- **DesignFiles:** For Verilog source files and design documents.
- **Testbenches:** For all testbench files, used to verify the functionality of each module.
- **Constraints:** For constraint files, such as pin layouts and clock settings.
- **Documentation:** For project reports and documentation.

---

## 3. Development of Hardware Components

### 3.1 Data Acquisition Module

This module simulates sensor data inputs, generating a continuous stream of data to assess the health of equipment. The module generates a 16-bit value that increments on each positive clock edge when not in a reset state.

#### 3.1.1 Design and Implementation
- **Module Ports**: 
  - Inputs: `clk` (clock), `reset` (active-high).
  - Output: `sensor_data` (16-bit register).
- **Reset Behavior**: When reset is high, `sensor_data` is set to 0.
- **Data Generation**: When not in reset, the data value is set to `16'hABCD`.

#### 3.1.2 Testbench for Data Acquisition Module
- **Setup Testbench**: Created `tb_data_acquisition.v` to simulate clock and reset signals. Simulated the module for 1000 ns, observing expected behavior through Vivado's waveform viewer.

### 3.2 Data Processing Module

The Data Processing Module processes the sensor data by multiplying it by 2, demonstrating a simple data processing task.

#### 3.2.1 Design and Implementation
- **Module Ports**:
  - Input: `sensor_data` (16-bit).
  - Output: `processed_data` (32-bit).
- **Verilog Source**: `data_processing.v`, which outputs `processed_data` as twice the value of `sensor_data`.

#### 3.2.2 Testbench for Data Processing Module
- Created `tb_data_processing.v` to verify multiplication logic. Simulated the module to observe the correct output for various inputs.

### 3.3 Predictive Analysis Module

This module analyzes the processed data and triggers an alert if the data exceeds a predefined threshold.

#### 3.3.1 Design and Implementation
- **Module Ports**:
  - Input: `processed_data` (32-bit).
  - Output: `alert` (1-bit).
- **Verilog Source**: `predictive_analysis.v`, which triggers `alert` when `processed_data` exceeds the threshold value `0x00001000`.

#### 3.3.2 Testbench for Predictive Analysis Module
- Created `tb_predictive_analysis.v` to verify alert logic under various conditions.

---

## 4. Integration with Zynq Processing System

### 4.1 Custom AXI IP Integration

- **Block Design Creation**: In Vivado's IP Integrator, created a block design named `predictive_maintenance_bd` and added the Zynq Processing System (PS).
- **Configure Clocks**: Enabled `FCLK_CLK0` with 100 MHz.
- **Custom AXI IP Creation**: Created a custom AXI4 peripheral and added it to the block design.

### 4.2 System Integration and Verification

- Connected PredictiveAnalysis IP to AXI Interconnect, validated design to ensure smooth data flow.

### 4.3 Clock and AXI Configuration

- Configured clocks and enabled `M_AXI_GP0` for communication between PS and PL.

### 4.4 Finalizing Connections

- Connected `M_AXI_GP0_ACLK` to `FCLK_CLK0`, verified and saved block design.

---

## 5. Generate Bitstream

### 5.1 Steps to Generate Bitstream
- **Synthesis and Implementation**: Ran synthesis and implementation in Vivado, ensuring no critical errors.
- **Generate Bitstream**: Generated bitstream to program FPGA fabric.

### 5.2 Export Hardware
- Exported hardware along with bitstream for use in Vitis IDE.

## 5.3 Software Development

### 5.3.1 Bare-Metal Application in Vitis
- Created a bare-metal application to interact with custom AXI IP. Implemented data acquisition, processing, and alert mechanism in C.

### 5.3.2 Testing and Debugging
- **Debugging with Breakpoints**: Used breakpoints to verify data flow.
- **UART Verification**: Verified UART communication for system status monitoring.

---

## 6. Conclusion

The predictive maintenance system was successfully developed in multiple phases, including data acquisition, processing, and analysis. Each module was verified through simulation. The entire system was integrated with the Zynq Processing System using custom AXI IP, allowing seamless communication between software and hardware components. Future work includes developing more advanced software applications for predictive analysis.

## 7. Future Work

- **Linux Integration**: Migrate the application to an embedded Linux environment.
- **Sensor Expansion**: Expand system support for additional sensors.
- **Machine Learning**: Integrate machine learning models for advanced predictive analytics.

## 8. References

1. Xilinx Embedded System Design Flow Documentation
2. Creating Custom AXI Stream IP Tutorial
3. Xilinx Embedded Design Tutorials - Zynq7000
4. FPGA Developer - Creating a Base System for the Zynq
5. [Creating Custom AXI Stream IP Tutorial with Vivado](https://www.mehmetburakaykenar.com/creating-custom-axi-stream-ip-tutorial-with-vivado/397/)
6. [Adaptive Support for Block Design and AXI Mapping in Vivado](https://adaptivesupport.amd.com/s/question/0D54U00006HC1EzSAL/block-design-address-editor-axi-mapping-issue-vivado-20221?language=en_US)
