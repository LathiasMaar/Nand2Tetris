------------------------------------------------------------------------
--   ▄▄▄▄▄▄▄ ▄▄▄▄▄▄   
--   █       █   ▄  █  
--   █   ▄   █  █ █ █  
--   █  █ █  █   █▄▄█▄ 
--   █  █▄█  █    ▄▄  █
--   █       █   █  █ █
--   █▄▄▄▄▄▄▄█▄▄▄█  █▄█
-- ______________________________________________________________________
-- @author. LathiasMaar
-- @brief. This code implements a OR gate with two inputs using
-- a structural architecture to define its structure.
-- 
-- @components. Nand gates (only)
-- 
-- @function. if (a or b) = 1: y = 1;
--            else: y = 0;
--
-- @truth_table.
--      _________________
--    /|  A  |  B  | Out |       Inputs             Outputs
--   | | --- | --- | --- |                 _______
--   | |  0  |  0  |  0  |          A ----|       |
--   | |  0  |  1  |  1  |                |  OR   |--- Y
--   | |  1  |  0  |  1  |          B ----|______/
--   | |  1  |  1  |  1  |                 
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
------------------------------------------------------------------------
entity Or2 is
    PORT(
        a, b : IN std_logic;
        y : OUT std_logic
    );
end Or2;
------------------------------------------------------------------------
architecture or_struct of Or2 is

    signal s1, s2 : std_logic;

    component Nand2
        PORT(
            a,b : IN std_logic;
            y : OUT std_logic);
    end component;

begin

    -- Instances of the components
    U1: Nand2 PORT MAP (
        a => a,
        b => a,
        y => s1    
    );

    U2: Nand2 PORT MAP (
        a => b,
        b => b,
        y => s2    
    );

    U3: Nand2 PORT MAP (
        a => s1,
        b => s2,
        y => y    
    );

end or_struct;
------------------------------------------------------------------------