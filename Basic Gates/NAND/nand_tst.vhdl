------------------------------------------------------------------------
-- Testbench for the NAND gate
-- |  A  |  B  |  Q  |
-- | --- | --- | --- |
-- |  0  |  0  |  1  |
-- |  0  |  1  |  1  |
-- |  1  |  0  |  1  |
-- |  1  |  1  |  0  |
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
------------------------------------------------------------------------
entity Test_Nand is
end Test_Nand;
------------------------------------------------------------------------
architecture test of Test_Nand is

    signal a, b, y: std_logic;

    component Nand2
        PORT(
            a,b: IN std_logic;
            y: OUT std_logic);
    end component;

begin
    -- Create the instance to the Nand2 component (the test unit)
    uut: Nand2 PORT MAP (
        a => a,
        b => b,
        y => y
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

    begin

        -- First combination a = 0, b = 0
        a <= '0';
        b <= '0';
        WAIT FOR 10 ns;
        if (y /= '1') then
            report "Error: a=0, b=0, y should be 1" severity error;
            test_passed := false;
        end if;

        -- Second combination a = 0, b = 1
        a <= '0';
        b <= '1';
        WAIT FOR 10 ns;
        if (y /= '1') then
            report "Error: a=0, b=0, y should be 1" severity error;
            test_passed := false;
        end if;

        -- Third combination a = 1, b = 0
        a <= '1';
        b <= '0';
        WAIT FOR 10 ns;
        if (y /= '1') then
            report "Error: a=0, b=0, y should be 1" severity error;
            test_passed := false;
        end if;

        -- Fourth combination a = 1, b = 1
        a <= '1';
        b <= '1';
        WAIT FOR 10 ns;
        if (y /= '0') then
            report "Error: a=0, b=0, y should be 0" severity error;
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