------------------------------------------------------------------------
-- Testbench for the NOT gate
-- |  A  |  Q  |
-- | --- | --- |
-- |  0  |  1  |
-- |  1  |  0  |
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
------------------------------------------------------------------------
entity Test_Not is
end Test_Not;
------------------------------------------------------------------------
architecture test of Test_Not is

    signal a, y: std_logic;

    component Not2
        PORT(
            a: IN std_logic;
            y: OUT std_logic);
    end component;

begin
    -- Create the instance to the Nand2 component (the test unit)
    uut: Not2 PORT MAP (
        a => a,
        y => y
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

    begin

        -- First combination a = 0
        a <= '0';
        WAIT FOR 10 ns;
        if (y /= '1') then
            report "Error: a=0, y should be 1" severity error;
            test_passed := false;
        end if;

        -- Second combination a = 1
        a <= '1';
        WAIT FOR 10 ns;
        if (y /= '0') then
            report "Error: a=0, y should be 0" severity error;
            test_passed := false;
        end if;

        -- Test completed
        if test_passed then
            report "Test completed successfully!" severity note;
        end if;

        WAIT;
    END PROCESS;

end test;
------------------------------------------------------------------------