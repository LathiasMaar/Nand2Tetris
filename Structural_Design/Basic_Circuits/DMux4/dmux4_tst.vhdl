------------------------------------------------------------------------
-- Testbench for the DMux4:
-- |  A  |  SEL1  |  SEL2  |  Y1  |  Y2  |  Y3  |  Y4  |
-- | --- | ------ | ------ | ---- | ---- | ---- | ---- |
-- |  0  |   0    |   0    |   0  |   -  |   -  |   -  |
-- |  1  |   0    |   0    |   1  |   -  |   -  |   -  |
-- |  0  |   1    |   0    |   -  |   0  |   -  |   -  |
-- |  1  |   1    |   0    |   -  |   1  |   -  |   -  |
-- |  0  |   0    |   1    |   -  |   -  |   0  |   -  |
-- |  1  |   0    |   1    |   -  |   -  |   1  |   -  |
-- |  0  |   1    |   1    |   -  |   -  |   -  |   0  |
-- |  1  |   1    |   1    |   -  |   -  |   -  |   1  |
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Test_DMux4 is
end Test_DMux4;
------------------------------------------------------------------------
architecture test of Test_DMux4 is

    signal a, s1, s2, y1, y2, y3, y4: std_logic;

    component DMux4
        PORT(
            a, s1, s2: IN std_logic;
            y1, y2, y3, y4: OUT std_logic);
    end component;

begin
    -- Create the instance to the DMux4 component (the test unit)
    uut: DMux4 PORT MAP (
        a => a,
        s1 => s1,
        s2 => s2,
        y1 => y1,
        y2 => y2,
        y3 => y3,
        y4 => y4
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

    begin
        -- Test 1: combination a=0, s1=0 y s2=0
        a <= '0';
        s1 <= '0';
        s2 <= '0';
        WAIT FOR 10 ns;
        if (y1 /= '0' and y2 /= '0' and y3 /= '0' and y4 /= '0') then
            report "Error: for a=0, s1=0 y s2=0, result expected y1=0, y2=0, y3=0, y4=0" severity error;
            test_passed := false;
        end if;

        -- Test 2: combination a=1, s1=0 y s2=0
        a <= '1';
        s1 <= '0';
        s2 <= '0';
        WAIT FOR 10 ns;
        if (y1 /= '1' and y2 /= '0' and y3 /= '0' and y4 /= '0') then
            report "Error: for a=1, s1=0 y s2=0, result expected y1=1, y2=0, y3=0, y4=0" severity error;
            test_passed := false;
        end if;

        -- Test 3: combination a=0, s1=1 y s2=0
        a <= '0';
        s1 <= '1';
        s2 <= '0';
        WAIT FOR 10 ns;
        if (y1 /= '0' and y2 /= '0' and y3 /= '0' and y4 /= '0') then
            report "Error: for a=0, s1=1 y s2=0, result expected y1=0, y2=0, y3=0, y4=0" severity error;
            test_passed := false;
        end if;

        -- Test 4: combination a=1, s1=1 y s2=0
        a <= '1';
        s1 <= '1';
        s2 <= '0';
        WAIT FOR 10 ns;
        if (y1 /= '0' and y2 /= '1' and y3 /= '0' and y4 /= '0') then
            report "Error: for a=1, s1=1 y s2=0, result expected y1=0, y2=1, y3=0, y4=0" severity error;
            test_passed := false;
        end if;

        -- Test 5: combination a=0, s1=0 y s2=1
        a <= '0';
        s1 <= '0';
        s2 <= '1';
        WAIT FOR 10 ns;
        if (y1 /= '0' and y2 /= '0' and y3 /= '0' and y4 /= '0') then
            report "Error: for a=0, s1=0 y s2=0, result expected y1=0, y2=0, y3=0, y4=0" severity error;
            test_passed := false;
        end if;

        -- Test 6: combination a=1, s1=0 y s2=1
        a <= '1';
        s1 <= '0';
        s2 <= '1';
        WAIT FOR 10 ns;
        if (y1 /= '0' and y2 /= '0' and y3 /= '1' and y4 /= '0') then
            report "Error: for a=1, s1=0 y s2=1, result expected y1=0, y2=0, y3=1, y4=0" severity error;
            test_passed := false;
        end if;
        
        -- Test 7: combination a=0, s1=1 y s2=1
        a <= '0';
        s1 <= '1';
        s2 <= '1';
        WAIT FOR 10 ns;
        if (y1 /= '0' and y2 /= '0' and y3 /= '0' and y4 /= '0') then
            report "Error: for a=0, s1=0 y s2=0, result expected y1=0, y2=0, y3=0, y4=0" severity error;
            test_passed := false;
        end if;

        -- Test 8: combination a=1, s1=1 y s2=1
        a <= '1';
        s1 <= '1';
        s2 <= '1';
        WAIT FOR 10 ns;
        if (y1 /= '0' and y2 /= '0' and y3 /= '0' and y4 /= '1') then
            report "Error: for a=1, s1=1 y s2=1, result expected y1=0, y2=0, y3=0, y4=1" severity error;
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