src_dir := $(dir $(lastword $(MAKEFILE_LIST)))

c_src := sc_print.c test.c

include $(inc_dir)/common.mk

default: log_requested_tgt $(bld_dir)/apb_spi_available.elf $(bld_dir)/apb_spi_available.hex $(bld_dir)/apb_spi_available.dump

log_requested_tgt:
	echo apb_spi_available.hex>> $(bld_dir)/test_info

clean:
	$(RM) $(c_objs) $(asm_objs) $(bld_dir)/apb_spi_available.elf $(bld_dir)/apb_spi_available.hex $(bld_dir)/apb_spi_available.dump