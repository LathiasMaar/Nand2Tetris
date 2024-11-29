-------------------------------------------------------------------------------------------
-- Testbench for the FULL_ADDER circuit.
-------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;

library libs;
use libs.all;
-------------------------------------------------------------------------------------------
entity Test_FullAdder is
end Test_FullAdder;
-------------------------------------------------------------------------------------------
architecture test of Test_FullAdder is

    signal a, b, c, sum, car: std_logic;

    component FullAdder
        PORT(
            a, b, c: IN std_logic;
            sum, car: OUT std_logic);
    end component;

begin
    -- Create the instance to the FullAdder component (the test unit)
    uut: FullAdder PORT MAP (
        a => a,
        b => b,
        c => c,
        sum => sum,
        car => car
    );

    test_process: PROCESS

        variable test_passed: boolean := true;

    begin
        -- Test 1: combination a = 0, b = 0, c = 0 
        a <= '0';
        b <= '0';
        c <= '0';
        WAIT FOR 10 ns;
        if (sum /= '0' and car /= '0') then
            report "Error: Test 1 expected result sum=0 and car=0" severity error;
            test_passed := false;
        end if;

        -- Test 2: combination a = 1, b = 0, c = 0 
        a <= '1';
        b <= '0';
        c <= '0';
        WAIT FOR 10 ns;
        if (sum /= '1' and car /= '0') then
            report "Error: Test 2 expected result sum=1 and car=0" severity error;
            test_passed := false;
        end if;

        -- Test 3: combination a = 0, b = 1, c = 0 
        a <= '0';
        b <= '1';
        c <= '0';
        WAIT FOR 10 ns;
        if (sum /= '1' and car /= '0') then
            report "Error: Test 3 expected result sum=1 and car=0" severity error;
            test_passed := false;
        end if;

        -- Test 4: combination a = 1, b = 1, c = 0 
        a <= '1';
        b <= '1';
        c <= '0';
        WAIT FOR 10 ns;
        if (sum /= '0' and car /= '1') then
            report "Error: Test 4 expected result sum=0 and car=1" severity error;
            test_passed := false;
        end if;

        -- Test 5: combination a = 0, b = 0, c = 1 
        a <= '0';
        b <= '0';
        c <= '1';
        WAIT FOR 10 ns;
        if (sum /= '1' and car /= '0') then
            report "Error: Test 5 expected result sum=1 and car=0" severity error;
            test_passed := false;
        end if;

        -- Test 6: combination a = 1, b = 0, c = 1 
        a <= '1';
        b <= '0';
        c <= '1';
        WAIT FOR 10 ns;
        if (sum /= '0' and car /= '1') then
            report "Error: Test 6 expected result sum=0 and car=1" severity error;
            test_passed := false;
        end if;

        -- Test 7: combination a = 0, b = 1, c = 1 
        a <= '0';
        b <= '1';
        c <= '1';
        WAIT FOR 10 ns;
        if (sum /= '0' and car /= '1') then
            report "Error: Test 7 expected result sum=0 and car=1" severity error;
            test_passed := false;
        end if;

        -- Test 8: combination a = 1, b = 1, c = 1 
        a <= '1';
        b <= '1';
        c <= '1';
        WAIT FOR 10 ns;
        if (sum /= '1' and car /= '1') then
            report "Error: Test 8 expected result sum=1 and car=1" severity error;
            test_passed := false;
        end if;

        -- Test completed
        if test_passed then
            report "All tests completed successfully!" severity note;
        end if;

        WAIT;
    END PROCESS;

end test;
-------------------------------------------------------------------------------------------