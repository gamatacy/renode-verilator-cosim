export ROOT_DIR := $(shell pwd)

RENODE_PATH ?=$(ROOT_DIR)/renode
RVI_PATH ?=$(ROOT_DIR)/renode-verilator-integration
SRC_PATH ?=$(ROOT_DIR)/apb_spi_master
BUILD_PATH ?=$(ROOT_DIR)/build
LIBOPENLIBM ?=$(ROOT_DIR)/renode-verilator-integration/lib/libopenlibm-Linux-x86_64.a
PLATFORM_DESC ?=$(ROOT_DIR)/apbspi.repl
SYSBUS_MODULE ?= sysbus.cosim
VERILATED_EXEC ?= $(BUILD_PATH)/Vtop
DEFUALT_TIMEOUT ?= 45s
SW_BUILD_PATH= $(ROOT_DIR)/sw/build
TARGET ?= apb_spi_available
.PHONY: build

build:
	mkdir -p $(BUILD_PATH) && cd $(BUILD_PATH) && cmake -DCMAKE_BUILD_TYPE=Release -DUSER_RENODE_DIR="$(RENODE_PATH)"  "$(SRC_PATH)" -DLIBOPENLIBM=$(LIBOPENLIBM)

run_robot: build 
	$(RENODE_PATH)/renode-test \
	    --show-log --verbose --debug-on-error --stop-on-error \
	    --variable ELF_FILE:$(SW_BUILD_PATH)/$(TARGET).elf \
	    --variable PLATFORM_DESC:$(PLATFORM_DESC) \
	    --variable SYSBUS_MODULE:$(SYSBUS_MODULE) \
	    --variable SIMULATION_SCRIPT:$(VERILATED_EXEC) \
		--variable DEFUALT_TIMEOUT:$(DEFUALT_TIMEOUT)  \
	    apbspi.robot