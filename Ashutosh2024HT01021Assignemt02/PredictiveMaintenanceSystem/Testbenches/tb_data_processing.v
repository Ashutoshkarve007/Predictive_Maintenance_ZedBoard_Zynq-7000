`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// College: BITS PILANI 
// Engineer:  ASHUTOSH RAJENDRA KARVE
// ROLL NO: 2024HT01021
// Create Date: 11/02/2024 09:06:20 PM
// Design Name: 
// Module Name: tb_data_processing
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Dependencies: 
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
module tb_data_processing();

reg [15:0] sensor_data;
wire [31:0] processed_data;

// Instantiate the data processing module
data_processing uut (
    .sensor_data(sensor_data),
    .processed_data(processed_data)
);

initial begin
    // Test sequence
    sensor_data = 16'h0001; // Test case 1
    #10;
    sensor_data = 16'h0010; // Test case 2
    #10;
    sensor_data = 16'h00FF; // Test case 3
    #10;
    sensor_data = 16'h1234; // Test case 4
    #10;

    $finish; // End simulation
end
endmodule
