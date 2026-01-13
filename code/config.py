from librelane.config import Config

Config.interactive(
    "adder",
    PDK = "sky130A",
    CLOCK_PORT = "clock",
    CLOCK_NET = "clock",
    CLOCK_PERIOD = 20,
    PRIMARY_GDSII_STREAMOUT_TOOL = "klayout",
)
