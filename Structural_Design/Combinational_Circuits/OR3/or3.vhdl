------------------------------------------------------------------------
-- This code implements a OR gate with three inputs 
-- using a structural architecture.
-- The function: 
--      if (a or b or c) = 1: y = 1;
--      else: y = 0;
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