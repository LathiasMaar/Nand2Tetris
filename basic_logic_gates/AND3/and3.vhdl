------------------------------------------------------------------------
--   ▄▄▄▄▄▄ ▄▄    ▄ ▄▄▄▄▄▄  ▄▄▄▄▄▄▄ 
--   █      █  █  █ █      ██       █
--   █  ▄   █   █▄█ █  ▄    █▄▄▄    █
--   █ █▄█  █       █ █ █   █▄▄▄█   █
--   █      █  ▄    █ █▄█   █▄▄▄    █
--   █  ▄   █ █ █   █       █▄▄▄█   █
--   █▄█ █▄▄█▄█  █▄▄█▄▄▄▄▄▄██▄▄▄▄▄▄▄█
-- ______________________________________________________________________
-- @author. LathiasMaar
-- @brief. This code implements a AND gate of three inputs using
-- a structural architecture to define its structure.
-- 
-- @components. and2 (gates)
-- 
-- @function. if (a and b and c) = 1: y = 1;
--            else: y = 0;
--
-- @truth_table.
--      _______________________
--    /|  A  |  B  |  C  | Out |       Inputs             Outputs
--   | | --- | --- | --- | --- |                 _______
--   | |  0  |  0  |  0  |  0  |          A ----|       |
--   | |  0  |  0  |  1  |  0  |                |       |
--   | |  0  |  1  |  0  |  0  |          B ----|  AND  | --- Y          
--   | |  0  |  1  |  1  |  0  |                |       |
--   | |  1  |  0  |  0  |  0  |          C ----|______/
--   | |  1  |  0  |  1  |  0  |                 
--   | |  1  |  1  |  0  |  0  | 
--   | |  1  |  1  |  1  |  1  | 
--   |/ ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯/
--    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity And3 is
    PORT(
        a, b, c : IN std_logic;
        y : OUT std_logic
    );
end And3;
------------------------------------------------------------------------
architecture and3_struct of And3 is

    signal a_and_b : std_logic;

    component And2
        PORT(
            a,b : IN std_logic;
            y : OUT std_logic);
    end component;

begin

    -- Instances of the components
    U1: And2 PORT MAP (
        a => a,
        b => b,
        y => a_and_b    
    );

    U2: And2 PORT MAP (
        a => a_and_b,
        b => c,
        y => y    
    );

end and3_struct;
------------------------------------------------------------------------