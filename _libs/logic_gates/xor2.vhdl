------------------------------------------------------------------------
--    ▄▄   ▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄   
--   █  █▄█  █       █   ▄  █  
--   █       █   ▄   █  █ █ █  
--   █       █  █ █  █   █▄▄█▄ 
--    █     ██  █▄█  █    ▄▄  █
--   █   ▄   █       █   █  █ █
--   █▄▄█ █▄▄█▄▄▄▄▄▄▄█▄▄▄█  █▄█
-- ______________________________________________________________________
-- @author. LathiasMaar
-- @brief. This code implements a XOR gate with two inputs using
-- a structural architecture to define its structure.
-- 
-- @components. Nand gates (only)
-- 
-- @function. if ((a or b) and (not(a) or not(b))) = 1: y = 1
--            else: y = 0;
--
-- @truth_table.
--      _________________
--    /|  A  |  B  | Out |       Inputs             Outputs
--   | | --- | --- | --- |                 _______
--   | |  0  |  0  |  0  |          A ----|       |
--   | |  0  |  1  |  1  |                |  XOR  |--- Y
--   | |  1  |  0  |  1  |          B ----|______/
--   | |  1  |  1  |  0  |                 
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
------------------------------------------------------------------------
entity Xor2 is
    PORT(
        a, b : IN std_logic;
        y : OUT std_logic
    );
end Xor2;
------------------------------------------------------------------------
architecture xor_struct of Xor2 is

    signal s1, s2, s3 : std_logic;

    component Nand2
        PORT(
            a,b : IN std_logic;
            y : OUT std_logic);
    end component;

begin

    -- Instances of the components
    U1: Nand2 PORT MAP (
        a => a,
        b => b,
        y => s1    
    );

    U2: Nand2 PORT MAP (
        a => a,
        b => s1,
        y => s2    
    );

    U3: Nand2 PORT MAP (
        a => s1,
        b => b,
        y => s3    
    );

    U4: Nand2 PORT MAP (
        a => s2,
        b => s3,
        y => y    
    );

end xor_struct;
------------------------------------------------------------------------