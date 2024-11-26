
```text
███╗   ██╗ █████╗ ███╗   ██╗██████╗    ██████╗   ████████╗███████╗████████╗██████╗ ██╗███████╗
████╗  ██║██╔══██╗████╗  ██║██╔══██╗   ╚════██╗  ╚══██╔══╝██╔════╝╚══██╔══╝██╔══██╗██║██╔════╝
██╔██╗ ██║███████║██╔██╗ ██║██║  ██║    █████╔╝     ██║   █████╗     ██║   ██████╔╝██║███████╗
██║╚██╗██║██╔══██║██║╚██╗██║██║  ██║   ██╔═══╝      ██║   ██╔══╝     ██║   ██╔══██╗██║╚════██║
██║ ╚████║██║  ██║██║ ╚████║██████╔╝   ███████╗     ██║   ███████╗   ██║   ██║  ██║██║███████║
╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝    ╚══════╝     ╚═╝   ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚══════╝
```
---

Nand2Tetris is a educative project focused on the construction of a 16-bit Von Neumann architecture 
Hack computer. The primarly goal is to build a computer from NAND gates capable of running the Tetris 
videogame. This is my own version of the original [Nand2Tetris](https://www.nand2tetris.org/) project, for which i have implemented
and simulated every component using VHDL (VHSIC Hardware Description Language) and GKTwave software.

## Project structure 
```
[Nand2Tetris]
  ╠ README.md                       # Project documentation
  ╠ [_libs]                         # Component library directory
  ║    ╠ [logic_gates]                  # Library of the basic logic gates used
  ║    ╠ [comb_components]              # Library of the combinational circuits
  ║    ╚ [16bits_components]            # Library of the 16 bits components
  ╠ [basic_logic_gates]             # Basic Logic Gates .vhdl files and test files
  ║    ╠ [AND2]                         # 2 inputs AND gate
  ║    ║   ╠ and2.vhdl                      # and2 entity implementation file 
  ║    ║   ╚ adn2_tst.vhdl                  # and2 test file
  ║    ╠ [AND3]                         # 3 inputs AND gate
  ║    ║   ╠ and3.vhdl                      # and3 entity implementation file 
  ║    ║   ╚ adn3_tst.vhdl                  # and3 test file
  ║    ╠ [NAND2]                        # 2 inputs NAND gate
  ║    ║   ╠ nand2.vhdl                     # nand2 entity implementation file 
  ║    ║   ╚ nadn2_tst.vhdl                 # nand2 test file
  ║    ╠ [NOT]                          # 2 inputs NOT gate
  ║    ║   ╠ not.vhdl                       # not entity implementation file 
  ║    ║   ╚ not_tst.vhdl                   # not test file
  ║    ╠ [OR2]                          # 2 inputs OR gate
  ║    ║   ╠ or2.vhdl                       # or2 entity implementation file 
  ║    ║   ╚ or2_tst.vhdl                   # or2 test file
  ║    ╠ [OR3]                          # 3 inputs OR gate
  ║    ║   ╠ or3.vhdl                       # or3 entity implementation file 
  ║    ║   ╚ or3_tst.vhdl                   # or3 test file
  ║    ╚ [XOR2]                         # 2 inputs XOR gate
  ║        ╠ xor2.vhdl                      # xor2 entity implementation file 
  ║        ╚ xor2_tst.vhdl                  # xor2 test file
  ╠ [combinational_circuits]        # Combinational circuits .vhdl files and test files
  ║    ╠ [DMUX2]                         # 2 channels Demultiplexor
  ║    ║   ╠ dmux2.vhdl                      # dmux2 entity implementation file 
  ║    ║   ╚ dmux2_tst.vhdl                  # dmux2 test file 
  ║    ╠ [DMUX4]                         # 4 channels Demultiplexor
  ║    ║   ╠ dmux4.vhdl                      # dmux4 entity implementation file 
  ║    ║   ╚ dmux4_tst.vhdl                  # dmux4 test file   
  ║    ╠ [FULL_ADDER]                    # full-adder circuit 
  ║    ║   ╠ f_adder.vhdl                    # f_adder entity implementation file 
  ║    ║   ╚ f_adder_tst.vhdl                # f_adder test file
  ║    ╠ [HALF_ADDER]                    # half-adder circuit 
  ║    ║   ╠ h_adder.vhdl                    # h_adder entity implementation file 
  ║    ║   ╚ h_adder_tst.vhdl                # h_adder test file
  ║    ╠ [MUX2]                          # 2 channels Multiplexor
  ║    ║   ╠ mux2.vhdl                       # mux2 entity implementation file 
  ║    ║   ╚ mux2_tst.vhdl                   # mux2 test file
  ║    ╠ [MUX4]                          # 4 channels Multiplexor
  ║    ║   ╠ mux4.vhdl                       # mux4 entity implementation file 
  ║    ║   ╚ mux4_tst.vhdl                   # mux4 test file 
  ║    ╚ [MUX8]                          # 8 channels Multiplexor
  ║        ╠ mux8.vhdl                       # mux8 entity implementation file 
  ║        ╚ mux8_tst.vhdl                   # mux8 test file
  ╠ [logic_circuits_16bits]         # 16-bits components .vhdl files and test files
  ║    ╠ [ADDER16]                       # 16-bits adder
  ║    ║   ╠ adder16.vhdl                    # adder16 entity implementation file 
  ║    ║   ╚ adder16_tst.vhdl                # adder16 test file
  ║    ╠ [AND16]                         # 16-bits adder
  ║    ║   ╠ and16.vhdl                      # and16 entity implementation file 
  ║    ║   ╚ adn16_tst.vhdl                  # and16 test file
  ║    ╠ [OR16]                          # 16-bits OR gate
  ║    ║   ╠ or16.vhdl                       # or16 entity implementation file 
  ║    ║   ╚ or16_tst.vhdl                   # or16 test file
  ║    ╠ [NOT16]                         # 16-bits NOT gate
  ║    ║   ╠ not16.vhdl                      # not16 entity implementation file 
  ║    ║   ╚ not16_tst.vhdl                  # not16 test file
  ║    ╠ [MUX2_16]                          # 2 channels 16-bits Multiplexor
  ║    ║   ╠ mux2_16.vhdl                       # mux2_16 entity implementation file 
  ║    ║   ╚ mux2_16_tst.vhdl                   # mux2_16 test file
  ║    ╠ [MUX4_16]                          # 4 channels 16-bits Multiplexor
  ║    ║   ╠ mux4_16.vhdl                       # mux4_16 entity implementation file 
  ║    ║   ╚ mux4_16_tst.vhdl                   # mux4_16 test file 
  ║    ╚ [MUX8_16]                          # 8 channels 16-bits Multiplexor
  ║        ╠ mux8_16.vhdl                       # mux8_16 entity implementation file 
  ║        ╚ mux8_16_tst.vhdl                   # mux8_16 test file
  ╠ [sequential_circuits]           # Sequential circuits .vhdl files and test files
       ╚ [...] 
```