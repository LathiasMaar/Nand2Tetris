------------------------------------------------------------------------
-- Testbench for the Mux2:
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Test_Mux2 is
end Test_Mux2;
------------------------------------------------------------------------
architecture test of Test_Mux2 is

    signal a, b, s, y: std_logic;

    component Mux2
        PORT(
            a, b, s: IN std_logic;
            y: OUT std_logic);
    end component;

begin
    -- Create the instance to the Mux2 component (the test unit)
    uut: Mux2 PORT MAP (
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
            report "Error: Test1 expected results is 0" severity error;
            test_passed := false;
        end if;

        -- Test 2: combination a = 0, b = 1, s=0
        a <= '0';
        b <= '1';
        s <= '0';
        WAIT FOR 10 ns;
        if (y /= a) then
            report "Error: Test1 expected results is 0" severity error;
            test_passed := false;
        end if;

        -- Test 3: combination a = 1, b = 0, s=0
        a <= '1';
        b <= '0';
        s <= '0';
        WAIT FOR 10 ns;
        if (y /= a) then
            report "Error: Test3 expected results is 1" severity error;
            test_passed := false;
        end if;

        -- Test 4: combination a = 1, b = 1, s=0
        a <= '1';
        b <= '1';
        s <= '0';
        WAIT FOR 10 ns;
        if (y /= a) then
            report "Error: Test4 expected results is 1" severity error;
            test_passed := false;
        end if;

        -- Test 5: combination a = 0, b = 0, sel=1
        a <= '0';
        b <= '0';
        s <= '1';
        WAIT FOR 10 ns;
        if (y /= b) then
            report "Error: Test5 expected results is 0" severity error;
            test_passed := false;
        end if;

        -- Test 6: combination a = 0, b = 1, sel=1
        a <= '0';
        b <= '1';
        s <= '1';
        WAIT FOR 10 ns;
        if (y /= b) then
            report "Error: Test6 expected results is 1" severity error;
            test_passed := false;
        end if;

        -- Test 7: combination a = 1, b = 0, sel=1
        a <= '1';
        b <= '0';
        s <= '1';
        WAIT FOR 10 ns;
        if (y /= b) then
            report "Error: Test7 expected results is 0" severity error;
            test_passed := false;
        end if;

        -- Test 8: combination a = 1, b = 1, sel=1
        a <= '1';
        b <= '1';
        s <= '1';
        WAIT FOR 10 ns;
        if (y /= b) then
            report "Error: Test8 expected results is 1" severity error;
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