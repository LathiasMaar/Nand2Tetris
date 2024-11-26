------------------------------------------------------------------------
-- This code implements a OR gate for a bus of 16 bits
-- using a structural architecture.
-- The function: 
--      if (a or b) = 1: y = 1;
--      else: y = 0;
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
------------------------------------------------------------------------
entity Or16 is
    PORT(
        a, b : IN std_logic_vector(15 downto 0);
        y : OUT std_logic_vector(15 downto 0)
    );
end Or16;
------------------------------------------------------------------------
architecture or_struct of Or16 is

    component Or2
        PORT(
            a,b : IN std_logic;
            y : OUT std_logic);
    end component;

begin

    -- Instances of the components
    U1: Or2 PORT MAP (a => a(0), b => b(0), y => y(0) );
    U2: Or2 PORT MAP (a => a(1), b => b(1), y => y(1) );
    U3: Or2 PORT MAP (a => a(2), b => b(2), y => y(2) );
    U4: Or2 PORT MAP (a => a(3), b => b(3), y => y(3) );
    U5: Or2 PORT MAP (a => a(4), b => b(4), y => y(4) );
    U6: Or2 PORT MAP (a => a(5), b => b(5), y => y(5) );
    U7: Or2 PORT MAP (a => a(6), b => b(6), y => y(6) );
    U8: Or2 PORT MAP (a => a(7), b => b(7), y => y(7) );
    U9: Or2 PORT MAP (a => a(8), b => b(8), y => y(8) );
    U10: Or2 PORT MAP (a => a(9), b => b(9), y => y(9) );
    U11: Or2 PORT MAP (a => a(10), b => b(10), y => y(10) );
    U12: Or2 PORT MAP (a => a(11), b => b(11), y => y(11) );
    U13: Or2 PORT MAP (a => a(12), b => b(12), y => y(12) );
    U14: Or2 PORT MAP (a => a(13), b => b(13), y => y(13) );
    U15: Or2 PORT MAP (a => a(14), b => b(14), y => y(14) );
    U16: Or2 PORT MAP (a => a(15), b => b(15), y => y(15) );

end or_struct;
------------------------------------------------------------------------