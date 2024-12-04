
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
  ║    ╠ [AND3]                         # 3 inputs AND gate
  ║    ╠ [NAND2]                        # 2 inputs NAND gate
  ║    ╠ [NOT]                          # 2 inputs NOT gate
  ║    ╠ [OR2]                          # 2 inputs OR gate
  ║    ╠ [OR3]                          # 3 inputs OR gate
  ║    ╚ [XOR2]                         # 2 inputs XOR gate
  ╠ [combinational_circuits]        # Combinational circuits .vhdl files and test files
  ║    ╠ [DMUX2]                         # 2 channels Demultiplexor
  ║    ╠ [DMUX4]                         # 4 channels Demultiplexor  
  ║    ╠ [FULL_ADDER]                    # full-adder circuit 
  ║    ╠ [HALF_ADDER]                    # half-adder circuit 
  ║    ╠ [MUX2]                          # 2 channels Multiplexor
  ║    ╠ [MUX4]                          # 4 channels Multiplexor
  ║    ╚ [MUX8]                          # 8 channels Multiplexor
  ╠ [logic_circuits_16bits]         # 16-bits components .vhdl files and test files
  ║    ╠ [ADDER16]                       # 16-bits adder
  ║    ╠ [AND16]                         # 16-bits adder
  ║    ╠ [OR16]                          # 16-bits OR gate
  ║    ╠ [NOT16]                         # 16-bits NOT gate
  ║    ╠ [MUX2_16]                       # 2 channels 16-bits Multiplexor
  ║    ╠ [MUX4_16]                       # 4 channels 16-bits Multiplexor
  ║    ╚ [MUX8_16]                       # 8 channels 16-bits Multiplexor
  ╠ [sequential_circuits]           # Sequential circuits .vhdl files and test files
  ║    ╠ [DFF]                           # Data Flip Flop 
  ║    ╠ [1-bit memory]                  # 
```