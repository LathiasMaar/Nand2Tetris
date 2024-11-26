------------------------------------------------------------------------
--   ▄▄▄▄▄▄▄ ▄▄    ▄ ▄▄▄▄▄▄  
--   █       █  █  █ █      █ 
--   █   ▄   █   █▄█ █  ▄    █
--   █  █▄█  █       █ █ █   █
--   █       █  ▄    █ █▄█   █
--   █   ▄   █ █ █   █       █
--   █▄▄█ █▄▄█▄█  █▄▄█▄▄▄▄▄▄█ 
-- ______________________________________________________________________
-- @author. LathiasMaar
-- @brief. This code implements a AND gate with two inputs using
-- a structural architecture to define its structure.
-- 
-- @components. Nand gates (only)
-- 
-- @function. if (a and b) = 1: y = 1;
--            else: y = 0;
--
-- @truth_table.
--      _________________
--    /|  A  |  B  | Out |       Inputs             Outputs
--   | | --- | --- | --- |                 _______
--   | |  0  |  0  |  0  |          A ----|       |
--   | |  0  |  1  |  0  |                |  AND  |--- Y
--   | |  1  |  0  |  0  |          B ----|______/
--   | |  1  |  1  |  1  |                 
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
------------------------------------------------------------------------
entity And2 is
    PORT(
        a, b : IN std_logic;
        y : OUT std_logic
    );
end And2;
------------------------------------------------------------------------
architecture and_struct of And2 is

    signal s1 : std_logic;

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
        a => s1,
        b => s1,
        y => y    
    );

end and_struct;
------------------------------------------------------------------------