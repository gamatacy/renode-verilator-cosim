# Paths
export root_dir := $(shell pwd)
export tst_dir  := $(root_dir)/tests
export inc_dir  := $(tst_dir)/common
export bld_dir  := $(root_dir)/build

# Environment
export CROSS_PREFIX  ?= $(root_dir)/sc-dt/riscv-gcc/bin/riscv64-unknown-elf-
export RISCV_GCC     ?= $(CROSS_PREFIX)gcc
export RISCV_OBJDUMP ?= $(CROSS_PREFIX)objdump -D
export RISCV_OBJCOPY ?= $(CROSS_PREFIX)objcopy -O verilog
export RISCV_READELF ?= $(CROSS_PREFIX)readelf -s

# Export arch variables
include $(root_dir)/arch.mk

# Use this parameter to set test to build
TARGET ?= apb_spi_available

# Targets
.PHONY: build

# Build test specified in TARGET
build: $(bld_dir)
	-$(MAKE) -C $(tst_dir)/$(TARGET)

$(bld_dir):
	mkdir -p $(bld_dir)

clean:
	$(RM) -R $(root_dir)/build/*

