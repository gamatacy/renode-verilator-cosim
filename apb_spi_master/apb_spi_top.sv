module apb_spi_top (
    input  logic                      HCLK,
    input  logic                      HRESETn,
    input  logic [11:0]              PADDR,
    input  logic               [31:0] PWDATA,
    input  logic                      PWRITE,
    input  logic                      PSEL,
    input  logic                      PENABLE,
    output logic               [31:0] PRDATA,
    output logic                      PREADY,
    output logic                      PSLVERR,

    output logic                [1:0] events_o,

    output logic                      spi_clk,
    output logic                      spi_csn0,
    output logic                      spi_csn1,
    output logic                      spi_csn2,
    output logic                      spi_csn3,
    output logic                [1:0] spi_mode,
    output logic                      spi_sdo0,
    output logic                      spi_sdo1,
    output logic                      spi_sdo2,
    output logic                      spi_sdo3,
    input  logic                      spi_sdi0,
    input  logic                      spi_sdi1,
    input  logic                      spi_sdi2,
    input  logic                      spi_sdi3
);

    // Instantiate the APB SPI Master
    apb_spi_master u_apb_spi_master (
        .HCLK(HCLK),
        .HRESETn(HRESETn),
        .PADDR(PADDR),
        .PWDATA(PWDATA),
        .PWRITE(PWRITE),
        .PSEL(PSEL),
        .PENABLE(PENABLE),
        .PRDATA(PRDATA),
        .PREADY(PREADY),
        .PSLVERR(PSLVERR),
        .events_o(events_o),

        .spi_clk(spi_clk),
        .spi_csn0(spi_csn0),
        .spi_csn1(spi_csn1),
        .spi_csn2(spi_csn2),
        .spi_csn3(spi_csn3),
        .spi_mode(spi_mode),
        .spi_sdo0(spi_sdo0),
        .spi_sdo1(spi_sdo1),
        .spi_sdo2(spi_sdo2),
        .spi_sdo3(spi_sdo3),
        .spi_sdi0(spi_sdi0),
        .spi_sdi1(spi_sdi1),
        .spi_sdi2(spi_sdi2),
        .spi_sdi3(spi_sdi3)
    );

    // Instantiate the SPI Slave Simulator
    spi_slave_simulator u_spi_slave_simulator (
        .HCLK(HCLK),
        .HRESETn(HRESETn),
        .spi_clk(spi_clk),
        .spi_csn0(spi_csn0),
        .spi_csn1(spi_csn1),
        .spi_csn2(spi_csn2),
        .spi_csn3(spi_csn3),
        .spi_sdi0(spi_sdi0),
        .spi_sdi1(spi_sdi1),
        .spi_sdi2(spi_sdi2),
        .spi_sdi3(spi_sdi3),
        .spi_sdo0(spi_sdo0),
        .spi_sdo1(spi_sdo1),
        .spi_sdo2(spi_sdo2),
        .spi_sdo3(spi_sdo3)
    );

endmodule