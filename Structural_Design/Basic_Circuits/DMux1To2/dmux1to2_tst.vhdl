------------------------------------------------------------------------
-- Testbench for the DMux1to2:
-- |  A  |  SEL  |  Y1  |  Y2  |
-- | --- | ----- | ---- | ---- |
-- |  0  |   0   |   0  |   0  |
-- |  0  |   1   |   0  |   0  |
-- |  1  |   0   |   1  |   0  |
-- |  1  |   1   |   0  |   1  |
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Test_DMux1to2 is
end Test_DMux1to2;
------------------------------------------------------------------------
architecture test of Test_DMux1to2 is

    signal a, s, y1, y2: std_logic;

    component DMux1to2
        PORT(
            a, s: IN std_logic;
            y1, y2: OUT std_logic);
    end component;

begin
    -- Create the instance to the DMux1to2 component (the test unit)
    uut: DMux1to2 PORT MAP (
        a => a,
        s => s,
        y1 => y1,
        y2 => y2
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

    begin
        -- First combination a = 0, s = 0
        a <= '0';
        s <= '0';
        WAIT FOR 10 ns;
        if (y1 /= '0' and y2 /= '0') then
            report "Error: for a=0 and s=0, result expected y1=0, y2=0" severity error;
            test_passed := false;
        end if;

        -- Second combination a = 0, s = 1
        a <= '0';
        s <= '1';
        WAIT FOR 10 ns;
        if (y1 /= '0' and y2 /= '0') then
            report "Error: for a=0 and s=1, result expected y1=0, y2=0" severity error;
            test_passed := false;
        end if;

        -- Third combination a = 1, s = 0
        a <= '1';
        s <= '0';
        WAIT FOR 10 ns;
        if (y1 /= '1' and y2 /= '0') then
            report "Error: for a=1 and s=0, result expected y1=1, y2=0" severity error;
            test_passed := false;
        end if;

        -- Fourth combination a = 1, s = 1
        a <= '1';
        s <= '1';
        WAIT FOR 10 ns;
        if (y1 /= '0' and y2 /= '1') then
            report "Error: for a=1 and s=1, result expected y1=0, y2=1" severity error;
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