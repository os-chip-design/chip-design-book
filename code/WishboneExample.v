module WishboneExample(
  input        clock,
  input        reset,
  input        wb_cyc,
  input        wb_stb,
  input        wb_we,
  input        wb_addr,
  input  [7:0] wb_din,
  output [7:0] wb_dout,
  output       wb_ack,
  input  [7:0] io_in,
  output [7:0] io_out
);
  reg [7:0] outReg;
  wire  _wb_ack_T = wb_cyc & wb_stb;
  reg [7:0] wb_dout_REG;
  reg [7:0] wb_dout_REG_1;
  assign wb_dout = wb_dout_REG_1;
  assign wb_ack = wb_cyc & wb_stb;
  assign io_out = outReg;
  always @(posedge clock) begin
    if (reset) begin
      outReg <= 8'h0;
    end else if (_wb_ack_T & wb_we) begin
      outReg <= wb_din;
    end
    wb_dout_REG <= io_in;
    wb_dout_REG_1 <= wb_dout_REG;
  end
endmodule