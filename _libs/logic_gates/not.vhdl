------------------------------------------------------------------------
--    ▄▄    ▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ 
--   █  █  █ █       █       █
--   █   █▄█ █   ▄   █▄     ▄█
--   █       █  █ █  █ █   █  
--   █  ▄    █  █▄█  █ █   █  
--   █ █ █   █       █ █   █  
--   █▄█  █▄▄█▄▄▄▄▄▄▄█ █▄▄▄█  
-- ______________________________________________________________________
-- @author. LathiasMaar
-- @brief. This code implements a NOT gate using 
-- a comportamental architecture to define its structure.
-- 
-- @components. Nand gates (only)
-- 
-- @function. if (a) = 1: y = 0;
--
-- @truth_table.
--      ___________
--    /|  A  | Out |       Inputs             Outputs
--   | | --- | --- |                 _______
--   | |  0  |  1  |          A ----|  NOT  |--- Y
--   | |  1  |  0  |                |______/                 
--   |/ ¯¯¯¯¯¯¯¯¯¯/
--    ¯¯¯¯¯¯¯¯¯¯¯
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
------------------------------------------------------------------------
entity Not2 is
    PORT(
        a : IN std_logic;
        y : OUT std_logic
    );
end Not2;
------------------------------------------------------------------------
architecture Not_struct of Not2 is

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
        y => y    
    );
end Not_struct;
------------------------------------------------------------------------