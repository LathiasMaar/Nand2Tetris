------------------------------------------------------------------------
-- This code implements a NOT gate with two inputs using 
-- a structural architecture and only NAND gates to define it.
-- The function: 
--      if a = 1: y = 0;
--      else: y = 1;
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