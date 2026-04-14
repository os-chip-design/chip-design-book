import chisel3._

class OpenRAMMemory extends Module {
    val io = IO(new Bundle {
        val addr = Input(UInt(8.W))
        val din   = Input(UInt(32.W))
        val we    = Input(Bool())
        val dout  = Output(UInt(32.W))
    })



   val mem = Module(new SramMacro)
   mem.io.clk0 := clock
   mem.io.csb0 := false.B
   mem.io.web0 := !io.we
   mem.io.wmask0 := "b1111".U
   mem.io.addr0 := io.addr
   mem.io.din0 := io.din
   io.dout := mem.io.dout0

   mem.io.clk1 := clock
   mem.io.csb1 := false.B
   mem.io.addr1 := io.addr
   // io.dout := mem.io.dout1
}

object OpenRAMMemory extends App {
    emitVerilog(new OpenRAMMemory, Array("--target-dir", "generated"))
}
