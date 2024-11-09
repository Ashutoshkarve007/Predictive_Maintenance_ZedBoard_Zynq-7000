`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2024 08:04:01 PM
// Design Name: 
// Module Name: tb_data_acquisition
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


module tb_data_acquisition();

reg clk = 0;
reg reset = 1;
wire [15:0] sensor_data;

// Instantiate the data acquisition module
data_acquisition uut (
    .clk(clk),
    .reset(reset),
    .sensor_data(sensor_data)
);

// Clock generation
always #5 clk = ~clk; // 10ns clock period

initial begin
    // Simulation sequence
    #10 reset = 0; // Release reset after 10ns
    #100 reset = 1; // Assert reset after 100ns
    #10 reset = 0; // Release reset again
    #200; // Observe behavior for 200ns
    
    $finish; // End simulation
end
endmodule