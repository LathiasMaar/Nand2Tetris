------------------------------------------------------------------------
-- This code implements a NOT gate for a bus of 16 bits using 
-- a structural architecture.
-- The function: 
--      if a = 1: y = 0;
--      else: y = 1;
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
------------------------------------------------------------------------
entity Not16 is
    PORT(
        a : IN std_logic_vector(15 downto 0);
        y : OUT std_logic_vector(15 downto 0)
    );
end Not16;
------------------------------------------------------------------------
architecture Not16_struct of Not16 is

    component Not_gate
        PORT(
            a: IN std_logic;
            y : OUT std_logic);
    end component;

begin
    -- Instances of the components for each bit
    U1: Not_Gate PORT MAP (a => a(0), y => y(0));
    U2: Not_Gate PORT MAP (a => a(1), y => y(1));
    U3: Not_Gate PORT MAP (a => a(2), y => y(2));
    U4: Not_Gate PORT MAP (a => a(3), y => y(3));
    U5: Not_Gate PORT MAP (a => a(4), y => y(4));
    U6: Not_Gate PORT MAP (a => a(5), y => y(5));
    U7: Not_Gate PORT MAP (a => a(6), y => y(6));
    U8: Not_Gate PORT MAP (a => a(7), y => y(7));
    U9: Not_Gate PORT MAP (a => a(8), y => y(8));
    U10: Not_Gate PORT MAP (a => a(9), y => y(9));
    U11: Not_Gate PORT MAP (a => a(10), y => y(10));
    U12: Not_Gate PORT MAP (a => a(11), y => y(11));
    U13: Not_Gate PORT MAP (a => a(12), y => y(12));
    U14: Not_Gate PORT MAP (a => a(13), y => y(13));
    U15: Not_Gate PORT MAP (a => a(14), y => y(14));
    U16: Not_Gate PORT MAP (a => a(15), y => y(15));

end Not16_struct;
------------------------------------------------------------------------