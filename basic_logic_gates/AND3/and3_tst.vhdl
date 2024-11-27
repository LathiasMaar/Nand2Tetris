------------------------------------------------------------------------
-- Testbench for the AND gate of 3 inputs
------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
------------------------------------------------------------------------
entity Test_And3 is
end Test_And3;
------------------------------------------------------------------------
architecture test of Test_And3 is

    signal a, b, c, y: std_logic;

    component And3
        PORT(
            a,b,c: IN std_logic;
            y: OUT std_logic);
    end component;

begin
    -- Create the instance to the And3 component (the test unit)
    uut: And3 PORT MAP (
        a => a,
        b => b,
        c => c,
        y => y
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

        begin
            -- Test 1: combination a = 0, b = 0, c = 0
            a <= '0';
            b <= '0';
            c <= '0';
            WAIT FOR 10 ns;
            if (y /= '0') then
                report "Error: Test1 expected result is 0" severity error;
                test_passed := false;
            end if;
    
            -- Test 2: combination a = 0, b = 0, c = 1
            a <= '0';
            b <= '0';
            c <= '1';
            WAIT FOR 10 ns;
            if (y /= '0') then
                report "Error: Test2 expected result is 0" severity error;
                test_passed := false;
            end if;
    
            -- Test 3: combination a = 0, b = 1, c = 0
            a <= '0';
            b <= '1';
            c <= '0';
            WAIT FOR 10 ns;
            if (y /= '0') then
                report "Error: Test3 expected result is 0" severity error;
                test_passed := false;
            end if;
    
            -- Test 4: combination a = 0, b = 1, c = 1
            a <= '0';
            b <= '1';
            c <= '1';
            WAIT FOR 10 ns;
            if (y /= '0') then
                report "Error: Test4 expected result is 0" severity error;
                test_passed := false;
            end if;
    
            -- Test 5: combination a = 1, b = 0, c = 0
            a <= '1';
            b <= '0';
            c <= '0';
            WAIT FOR 10 ns;
            if (y /= '0') then
                report "Error: Test5 expected result is 0" severity error;
                test_passed := false;
            end if;
    
            -- Test 6: combination a = 1, b = 0, c = 1
            a <= '1';
            b <= '0';
            c <= '1';
            WAIT FOR 10 ns;
            if (y /= '0') then
                report "Error: Test6 expected result is 0" severity error;
                test_passed := false;
            end if;
    
            -- Test 7: combination a = 1, b = 1, c = 0
            a <= '1';
            b <= '1';
            c <= '0';
            WAIT FOR 10 ns;
            if (y /= '0') then
                report "Error: Test7 expected result is 0" severity error;
                test_passed := false;
            end if;
    
            -- Test 8: combination a = 1, b = 1, c = 1
            a <= '1';
            b <= '1';
            c <= '1';
            WAIT FOR 10 ns;
            if (y /= '1') then
                report "Error: Test8 expected result is 1" severity error;
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