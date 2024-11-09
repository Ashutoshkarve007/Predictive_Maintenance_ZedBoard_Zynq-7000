`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// College: BITS PILANI 
// Engineer: ASHUTOSH RAJENDRA KARVE
// ROLL NO: 2024HT01021
// Create Date: 11/02/2024 10:04:03 PM
// Design Name: 
// Module Name: tb_predictive_analysis
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
module tb_predictive_analysis();

reg [31:0] processed_data;
wire alert;

// Instantiate the predictive analysis module
predictive_analysis uut (
    .processed_data(processed_data),
    .alert(alert)
);

initial begin
    // Test sequence
    processed_data = 32'h00000500; // Below threshold, no alert expected
    #10;
    processed_data = 32'h00001200; // Above threshold, alert expected
    #10;
    processed_data = 32'h00000FFF; // Just below threshold, no alert
    #10;
    processed_data = 32'h00002000; // Well above threshold, alert expected
    #10;

    $finish; // End simulation
end
endmodule
