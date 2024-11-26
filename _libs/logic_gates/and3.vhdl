------------------------------------------------------------------------
-- This code implements a AND gate with three inputs 
-- using a structural architecture.
-- The function: 
--      if (a and b and c) = 1: y = 1;
--      else: y = 0;
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