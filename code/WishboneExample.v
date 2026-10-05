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
  reg       ackReg;
  reg [7:0] wb_dout_REG;
  reg [7:0] wb_dout_REG_1;
  always @(posedge clock) begin
    if (reset) begin
      outReg <= 8'h0;
      ackReg <= 1'b0;
    end else begin
      if (ackReg) begin
        ackReg <= 1'b0;
      end else if (wb_cyc & wb_stb) begin
        ackReg <= 1'b1;
      end
      if (wb_cyc & wb_stb & wb_we) begin
        outReg <= wb_din[7:0];
      end
    end
    wb_dout_REG <= io_in;
    wb_dout_REG_1 <= wb_dout_REG;
  end
  assign wb_dout = {{24'd0}, wb_dout_REG_1};
  assign wb_ack = ackReg;
  assign io_out = outReg;
endmodule