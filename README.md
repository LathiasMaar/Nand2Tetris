Para compilar la libreria en la carpeta:
ghdl -a --work=libs "F:\The Lab\NAND to Tetris\libs\logic_gates\*.vhdl" 
ghdl -a --work=libs [ficheros]
ghdl -r --work=libs [entidad] --wave=output.ghw
gtkwave .\output.ghw

mi repositorio es:
|-libs
|     \_logic_gates 
|            |-and2.vhdl
|            |-nand2.vhdl
|            |-not.vhdl
|            |-or2.vhdl
|            |-xor2.vhdl
\_ Structural_Design
        |_Basic_Circuits
        |        (...)
        \_Basic_Logic_Gates
            |-AND2
            |    |_and.vhdl
            |    \_and_tst.vhdl
            |-NAND2
            |    |_nand.vhdl
            |    \_nand_tst.vhdl
            |-NOT
            |    |_not.vhdl
            |    \_not_tst.vhdl
            |-OR
            |    |_or.vhdl
            |    \_or_tst.vhdl
            |-XOR2
                 |_xor.vhdl
                 \_xor_tst.vhdl
