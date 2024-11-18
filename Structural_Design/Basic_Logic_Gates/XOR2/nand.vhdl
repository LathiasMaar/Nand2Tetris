------------------------------------------------------------------------
-- This code implements a NAND gate with two inputs 
-- using a comportamental architecture to define it.
-- The function: 
--      if (a and b) = 1: y = 0;
--      else: y = 1;
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
------------------------------------------------------------------------
entity Nand2 is
    PORT(
        a, b : IN std_logic;
        y : OUT std_logic
    );
end Nand2;
------------------------------------------------------------------------
architecture Nand_behav of Nand2 is
begin
    y <= NOT (a AND b); 
end Nand_behav;
------------------------------------------------------------------------