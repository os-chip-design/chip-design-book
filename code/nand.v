
module sky130_fd_sc_hd__nand2 (
    Y,
    A,
    B
);

    // Module ports
    output Y;
    input  A;
    input  B;

    // Module supplies
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    // Local signals
    wire nand0_out_Y;

    //   Name   Output       Other arguments
    nand nand0 (nand0_out_Y, B, A           );
    buf  buf0  (Y          , nand0_out_Y    );

endmodule
