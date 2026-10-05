import chisel3._
// Wishbone interface definition (classic, minimal)
class WishboneIO(addrWidth: Int, dataWidth: Int) extends Bundle {
  val cyc = Input(Bool())
  val stb = Input(Bool())
  val we = Input(Bool())
  val addr = Input(UInt(addrWidth.W))
  val din = Input(UInt(dataWidth.W))
  val dout = Output(UInt(dataWidth.W))
  val ack = Output(Bool())
}

// Simple Wishbone device: 8-bit in, 8-bit out
class WishboneExample extends Module {
  val wb = IO(new WishboneIO(addrWidth = 1, dataWidth = 32))
  val io = IO(new Bundle {
    val in = Input(UInt(8.W))
    val out = Output(UInt(8.W))
  })
  val outReg = RegInit(0.U(8.W))
  // wishbone acknowledge register
  val ackReg = RegInit(0.B)
  when(ackReg) {
    ackReg := 0.B
  }.elsewhen(wb.cyc && wb.stb) {
    ackReg := 1.B
  }
  wb.ack := ackReg
  io.out := outReg
  // input with two FFs to contain meta stability
  wb.dout := RegNext(RegNext(io.in))
  // Wishbone write
  when(wb.cyc && wb.stb && wb.we) {
    outReg := wb.din
  }
}

object WishboneExample extends App {
  emitVerilog(new WishboneExample, Array("--target-dir", "generated"))
}