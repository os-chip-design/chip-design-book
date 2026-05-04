import chisel3._

// Explore cost of multiplication and division
class MulDiv extends Module {
    val io = IO(new Bundle {
        val a  = Input(UInt(32.W))
        val b  = Input(UInt(32.W))
        val out = Output(UInt(64.W))
    })

    val aReg = RegNext(io.a)
    val bReg = RegNext(io.b)

    val outReg = RegInit(0.U(64.W))
    outReg := aReg * bReg
    io.out := outReg
}

object MulDiv extends App {
    emitVerilog(new MulDiv, Array("--target-dir", "generated"))
}