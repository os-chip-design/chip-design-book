# Python, cocotb test for the adder module
import cocotb
from cocotb.triggers import FallingEdge, Timer

async def generate_clock(dut):
    """Generate clock pulses."""

    for cycle in range(10):
        print(f"Cycle {cycle}")
        dut.clock.value = 0
        await Timer(5, units="ns")
        dut.clock.value = 1
        await Timer(5, units="ns")

@cocotb.test()
async def test_adder(dut):
    """Testing our adder circuit."""

    # run the clock in the background
    await cocotb.start(generate_clock(dut))

    # wait for two falling edges
    await FallingEdge(dut.clock)
    await FallingEdge(dut.clock)
    # will be undefined
    dut._log.info("sum is %s", dut.sum.value)

    dut.a.value = 1
    dut.b.value = 2

    # wait two clock cycles for the result
    await FallingEdge(dut.clock)
    await FallingEdge(dut.clock)
    dut._log.info("sum is %s", dut.sum.value)
    # assert dut.sum == 3, "Summ shall be 3"