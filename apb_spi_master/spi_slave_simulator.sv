module spi_slave_simulator (
    input logic HCLK,
    input logic HRESETn,
    input logic spi_clk,
    input logic spi_csn0,
    input logic spi_csn1,
    input logic spi_csn2,
    input logic spi_csn3,
    input logic spi_sdi0,
    input logic spi_sdi1,
    input logic spi_sdi2,
    input logic spi_sdi3,
    output logic spi_sdo0,
    output logic spi_sdo1,
    output logic spi_sdo2,
    output logic spi_sdo3
);

  logic [31:0] random_data; // Register to hold the generated random data
  logic [31:0] lfsr; // LFSR for generating pseudo-random numbers
  logic [31:0] data_out;

  // LFSR initialization
  initial begin
    lfsr = 32'hACE1; // Seed value (non-zero)
  end

  // LFSR for random number generation
  always_ff @(posedge HCLK) begin
    if (!HRESETn) begin
      random_data <= 32'h0; // Reset the random data on reset
      lfsr <= 32'hACE1; // Reset the LFSR on reset
    end else if (spi_csn0 == 1'b0) begin
      // Generate next random number using LFSR feedback
      lfsr <= {lfsr[30:0], lfsr[31] ^ lfsr[21] ^ lfsr[1] ^ lfsr[0]}; // Example taps
      random_data <= lfsr; // Assign the new random number
    end
  end

  // Handling SPI communication (example, adjust based on your needs)
  always_ff @(posedge spi_clk) begin
    if (spi_csn0 == 1'b0) begin
      spi_sdo0 = random_data[0]; // Output the least significant bit as an example
      // Additional output logic depending on your SPI protocol
    end
  end

endmodule