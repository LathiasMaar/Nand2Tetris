------------------------------------------------------------------------
--    ▄▄▄▄▄▄▄ ▄▄▄▄▄▄   ▄▄▄▄▄▄▄ 
--   █       █   ▄  █ █       █
--   █   ▄   █  █ █ █ █▄▄▄    █
--   █  █ █  █   █▄▄█▄ ▄▄▄█   █
--   █  █▄█  █    ▄▄  █▄▄▄    █
--   █       █   █  █ █▄▄▄█   █
--   █▄▄▄▄▄▄▄█▄▄▄█  █▄█▄▄▄▄▄▄▄█
-- ______________________________________________________________________
-- @author. LathiasMaar
-- @brief. This code implements a OR gate of three inputs using
-- a structural architecture to define its structure.
-- 
-- @components. or2 (gates)
-- 
-- @function. if (a or b or c) = 1: y = 1;
--            else: y = 0;
--
-- @truth_table.
--      _______________________
--    /|  A  |  B  |  C  | Out |       Inputs             Outputs
--   | | --- | --- | --- | --- |                 _______
--   | |  0  |  0  |  0  |  0  |          A ----|       |
--   | |  0  |  0  |  1  |  1  |                |       |
--   | |  0  |  1  |  0  |  1  |          B ----|  OR   | --- Y          
--   | |  0  |  1  |  1  |  1  |                |       |
--   | |  1  |  0  |  0  |  1  |          C ----|______/
--   | |  1  |  0  |  1  |  1  |                 
--   | |  1  |  1  |  0  |  1  | 
--   | |  1  |  1  |  1  |  1  | 
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Or3 is
    PORT(
        a, b, c : IN std_logic;
        y : OUT std_logic
    );
end Or3;
------------------------------------------------------------------------
architecture or3_struct of Or3 is

    signal a_or_b: std_logic;

    component Or2
        PORT(
            a,b : IN std_logic;
            y : OUT std_logic);
    end component;

begin

    -- Instances of the components
    U1: Or2 PORT MAP (
        a => a,
        b => b,
        y => a_or_b    
    );

    U2: Or2 PORT MAP (
        a => a_or_b,
        b => c,
        y => y    
    );

end or3_struct;
------------------------------------------------------------------------