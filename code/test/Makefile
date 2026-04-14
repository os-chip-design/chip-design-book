# Makefile for cocotb
# defaults
SIM = icarus
TOPLEVEL_LANG = verilog

VERILOG_SOURCES += ../adder.v
PDK_ROOT ?= $(HOME)/.ciel
#VERILOG_SOURCES += ../runs/RUN_2026-04-03_12-05-14/final/nl/adder.nl.v
#VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v
#VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v
TOPLEVEL = adder
# MODULE is the basename of the Python test file
MODULE = test_adder

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
