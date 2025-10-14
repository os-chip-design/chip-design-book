module WishboneExample(
  input        clock,
  input        reset,
  input        wb_cyc,
  input        wb_stb,
  input        wb_we,
  input        wb_addr,
  input  [31:0] wb_din,
  output [31:0] wb_dout,
  output       wb_ack,
  input  [7:0] io_in,
  output [7:0] io_out
);
  reg [7:0] outReg;
  reg [7:0] wb_dout_REG;
  reg [7:0] wb_dout_REG_1;
  assign wb_dout = {{24'd0}, wb_dout_REG_1};
  assign wb_ack = wb_cyc & wb_stb;
  assign io_out = outReg;
  always @(posedge clock) begin
    if (reset) begin
      outReg <= 8'h0;
    end else if (wb_cyc & wb_stb & wb_we) begin
      outReg <= wb_din[7:0];
    end
    wb_dout_REG <= io_in;
    wb_dout_REG_1 <= wb_dout_REG;
  end
endmodule