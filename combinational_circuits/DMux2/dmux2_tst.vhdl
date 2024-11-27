------------------------------------------------------------------------
-- Testbench for the DMux2:
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Test_DMux2 is
end Test_DMux2;
------------------------------------------------------------------------
architecture test of Test_DMux2 is

    signal a, s, y1, y2: std_logic;

    component DMux2
        PORT(
            a, s: IN std_logic;
            y1, y2: OUT std_logic);
    end component;

begin
    -- Create the instance to the DMux2 component (the test unit)
    uut: DMux2 PORT MAP (
        a => a,
        s => s,
        y1 => y1,
        y2 => y2
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

    begin
        -- Test1: combination a = 0, s = 0
        a <= '0';
        s <= '0';
        WAIT FOR 10 ns;
        if (y1 /= '0' and y2 /= '0') then
            report "Error: Test1 expected results are y1=0, y2=0" severity error;
            test_passed := false;
        end if;

        -- Test2: combination a = 0, s = 1
        a <= '0';
        s <= '1';
        WAIT FOR 10 ns;
        if (y1 /= '0' and y2 /= '0') then
            report "Error: Test2 expected results are y1=0, y2=0" severity error;
            test_passed := false;
        end if;

        -- Test3: combination a = 1, s = 0
        a <= '1';
        s <= '0';
        WAIT FOR 10 ns;
        if (y1 /= '1' and y2 /= '0') then
            report "Error: Test3 expected results are y1=1, y2=0" severity error;
            test_passed := false;
        end if;

        -- Test4: combination a = 1, s = 1
        a <= '1';
        s <= '1';
        WAIT FOR 10 ns;
        if (y1 /= '0' and y2 /= '1') then
            report "Error: Test4 expected results are y1=0, y2=1" severity error;
            test_passed := false;
        end if;

        -- Test completed
        if test_passed then
            report "All tests completed successfully!" severity note;
        end if;

        WAIT;
    END PROCESS;

end test;
------------------------------------------------------------------------