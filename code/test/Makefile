# Makefile for cocotb
# defaults
SIM = icarus
TOPLEVEL_LANG = verilog

VERILOG_SOURCES += ../adder.v
TOPLEVEL = adder
# MODULE is the basename of the Python test file
MODULE = test_adder

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
