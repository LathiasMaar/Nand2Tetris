------------------------------------------------------------------------
-- Testbench for the Mux1to2:
-- |  SEL  |  A  |  B  |  Y  | 
-- | ----- | --- | --- | --- | 
-- |  0    |  0  |  0  |  0  | 
-- |  0    |  0  |  1  |  0  |
-- |  0    |  1  |  0  |  1  |
-- |  0    |  1  |  1  |  1  |
-- |  1    |  0  |  0  |  0  | 
-- |  1    |  0  |  1  |  1  |
-- |  1    |  1  |  0  |  0  |
-- |  1    |  1  |  1  |  1  |
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Test_Mux2to1 is
end Test_Mux2to1;
------------------------------------------------------------------------
architecture test of Test_Mux2to1 is

    signal a, b, s, y: std_logic;

    component Mux2to1
        PORT(
            a, b, s: IN std_logic;
            y: OUT std_logic);
    end component;

begin
    -- Create the instance to the DMux1to2 component (the test unit)
    uut: Mux2to1 PORT MAP (
        a => a,
        b => b,
        s => s,
        y => y
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

    begin
        -- Test 1: combination a = 0, b = 0, s=0
        a <= '0';
        b <= '0';
        s <= '0';
        WAIT FOR 10 ns;
        if (y /= a) then
            report "Error: for a=0, b=0 and s=0, result expected y=0" severity error;
            test_passed := false;
        end if;

        -- Test 2: combination a = 0, b = 1, s=0
        a <= '0';
        b <= '1';
        s <= '0';
        WAIT FOR 10 ns;
        if (y /= a) then
            report "Error: for a=0, b=1 and s=0, result expected y=0" severity error;
            test_passed := false;
        end if;

        -- Test 3: combination a = 1, b = 0, s=0
        a <= '1';
        b <= '0';
        s <= '0';
        WAIT FOR 10 ns;
        if (y /= a) then
            report "Error: for a=1, b=0 and s=0, result expected y=1" severity error;
            test_passed := false;
        end if;

        -- Test 4: combination a = 1, b = 1, s=0
        a <= '1';
        b <= '1';
        s <= '0';
        WAIT FOR 10 ns;
        if (y /= a) then
            report "Error: for a=1, b=1 and s=0, result expected y=1" severity error;
            test_passed := false;
        end if;

        -- Test 5: combination a = 0, b = 0, sel=1
        a <= '0';
        b <= '0';
        s <= '1';
        WAIT FOR 10 ns;
        if (y /= b) then
            report "Error: for a=0, b=0 and s=1, result expected y=0" severity error;
            test_passed := false;
        end if;

        -- Test 6: combination a = 0, b = 1, sel=1
        a <= '0';
        b <= '1';
        s <= '1';
        WAIT FOR 10 ns;
        if (y /= b) then
            report "Error: for a=0, b=1 and s=1, result expected y=1" severity error;
            test_passed := false;
        end if;

        -- Test 7: combination a = 1, b = 0, sel=1
        a <= '1';
        b <= '0';
        s <= '1';
        WAIT FOR 10 ns;
        if (y /= b) then
            report "Error: for a=1, b=0 and s=1, result expected y=0" severity error;
            test_passed := false;
        end if;

        -- Test 8: combination a = 1, b = 1, sel=1
        a <= '1';
        b <= '1';
        s <= '1';
        WAIT FOR 10 ns;
        if (y /= b) then
            report "Error: for a=1, b=1 and s=1, result expected y=1" severity error;
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