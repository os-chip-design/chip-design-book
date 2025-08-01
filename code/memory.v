module memory(
    input rst_n,
    input clock,
    input cs,
    input we,
    input [7:0] read_addr,
    input [7:0] write_addr,
    input [3:0] write_mask,
    input [31:0] datain,
    output [31:0] dataout0,
    output [31:0] dataout1);


sky130_sram_1kbyte_1rw1r_32x256_8 mem (
    .clk0(clock),
    .csb0(~cs),
    .web0(~we),
    .wmask0(write_mask),
    .addr0(write_addr[7:0]),
    .din0(datain),
    .dout0(dataout0),
    .clk1(clock),
    .csb1(~cs),
    .addr1(read_addr[7:0]),
    .dout1(dataout1)
);

/*
sram22_256x32m4w8 mem (
    .clk(clock),
    .rstb(~rst_n),
    .ce(cs),
    .we(we),
    .addr(read_addr[7:0]),
    .wmask(write_mask),
    .din(datain),
    .dout(dataout0)
);
*/


endmodule