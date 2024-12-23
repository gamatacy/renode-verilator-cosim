cmake_minimum_required(VERSION 3.8)

# Name of the project
project(apb_spi_master)

# Verilog file containing the top module to be Verilated
set(VTOP apb_spi_top.sv apb_spi_master.sv spi_master_apb_if.sv spi_master_clkgen.sv spi_master_controller.sv spi_master_fifo.sv spi_master_rx.sv spi_master_tx.sv spi_slave_simulator.sv)

# C/C++ source files to be compiled
set(CSOURCES sim_main.cpp)

# Additional compiling, linking or verilating arguments (respectively)
set(COMP_EXEC_ARGS -DINVERT_RESET -Wno-lint)
set(COMP_LIB_ARGS -fPIC -DINVERT_RESET -Wno-lint)
#set(LINK_EXEC_ARGS ...)
#set(LINK_LIB_ARGS ...)
set(VERI_EXEC_ARGS -Wno-lint  --trace)
set(VERI_LIB_ARGS -Wno-lint --trace)

# CMake file doing the hard job
include(../renode-verilator-integration/cmake/configure-and-verilate.cmake)
