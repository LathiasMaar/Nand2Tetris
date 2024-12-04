------------------------------------------------------------------------
--    ▄▄▄▄▄▄  ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ 
--   █      ██       █       █
--   █  ▄    █    ▄▄▄█    ▄▄▄█
--   █ █ █   █   █▄▄▄█   █▄▄▄ 
--   █ █▄█   █    ▄▄▄█    ▄▄▄█
--   █       █   █   █   █    
--   █▄▄▄▄▄▄██▄▄▄█   █▄▄▄█    
-- ______________________________________________________________________
-- @author. LathiasMaar
-- @brief. This code implements a Data Flip Flop. It works like a delay
-- where the value of the output of Qk will be updated in the next clk
-- pulse with the current value of D.
-- 
-- @components. Not gates, Nand gates
-- 
-- @function. Q(k+1) = D(k)
--
-- @truth_table.
--      ___________________
--    /|  D  |  Qk |  Qk+1 |             Inputs               Outputs
--   | | --- | --- | ----- |                       _________
--   | |  0  |  0  |   0   |                 D ---|         |--- Q
--   | |  0  |  1  |   0   |                      |   DFF   |                         
--   | |  1  |  0  |   1   |                clk --|\________|--- ~Q (Qn)
--   | |  1  |  1  |   1   |
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/  
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯            
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity DFF is
    Port (
        d, clk: IN std_logic;
        Q, Qn: OUT std_logic
    );
end DFF;
------------------------------------------------------------------------
architecture structure of DFF is
    
    signal not_d, set, reset:std_logic;
    signal Q_in, Qn_in:std_logic;

    component Not_gate
        port(
            a : in std_logic;
            y : out std_logic
        );
    end component;

    component Nand2
        port(
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;

begin
    U1: Not_gate PORT map(
        a => d,
        y => not_d  
    );

    U2: Nand2 PORT map(
        a => not_d,
        b => clk,
        y => reset  
    );

    U3: Nand2 PORT map(
        a => d,
        b => clk,
        y => set  
    );

    U4: Nand2 PORT map(
        a => set,
        b => Qn_in,
        y => Q_in  
    );

    U5: Nand2 PORT map(
        a => reset,
        b => Q_in,
        y => Qn_in  
    );

    Q <= Q_in;
    Qn <= Qn_in;

end structure;
------------------------------------------------------------------------
