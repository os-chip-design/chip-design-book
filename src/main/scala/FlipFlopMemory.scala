import chisel3._

class FlipFlopMemory extends Module {
    val io = IO(new Bundle {
        val addr = Input(UInt(7.W))
        val din   = Input(UInt(8.W))
        val we    = Input(Bool())
        val dout  = Output(UInt(8.W))
    })


   val mem = Reg(Vec(128, UInt(8.W)))
   when(io.we) {
       mem(io.addr) := io.din
   }
   io.dout := mem(io.addr)
}

object FlipFlopMemory extends App {
    emitVerilog(new FlipFlopMemory, Array("--target-dir", "generated"))
}
